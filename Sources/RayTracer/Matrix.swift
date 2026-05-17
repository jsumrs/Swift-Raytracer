import Foundation

struct Matrix {
  let data: [[Double]]
  var isInvertible: Bool {
    self.determinant() != 0
  }

  static let identity4x4 = Matrix(with: [
      [1,0,0,0],
      [0,1,0,0],
      [0,0,1,0],
      [0,0,0,1],
    ])

  init (with data: [[Double]]) {
    self.data = data
  }

  subscript(row: Int, col: Int) -> Double {
    get { data[row][col] }
  }

  static func ==(lhs: Matrix, rhs: Matrix) -> Bool {
    lhs.data.count == rhs.data.count &&
    zip(lhs.data, rhs.data).allSatisfy({$0.elementsEqual($1, by: { Double.nearEqual($0, $1)})})
  }

  static func !=(lhs: Matrix, rhs: Matrix) -> Bool {
    !(lhs == rhs)
  }
  
  static func *(lhs: Matrix, rhs: Matrix) -> Matrix {
    // Assume lhs and rhs are the same size.
    var M: [[Double]] = [
      [0,0,0,0],
      [0,0,0,0],
      [0,0,0,0],
      [0,0,0,0],
    ]
    for row in 0...3 {
      for col in 0...3 {
        M[row][col] = lhs[row, 0] * rhs[0, col] +
                      lhs[row, 1] * rhs[1, col] +
                      lhs[row, 2] * rhs[2, col] +
                      lhs[row, 3] * rhs[3, col]
      }
    }
    return Matrix(with: M)
  }

  static func *(lhs: Matrix, rhs: Vec3) -> Vec3 {
    let x = lhs[0,0] * rhs.x + lhs[0,1] * rhs.y + lhs[0,2] * rhs.z + lhs[0,3] * 0
    let y = lhs[1,0] * rhs.x + lhs[1,1] * rhs.y + lhs[1,2] * rhs.z + lhs[1,3] * 0
    let z = lhs[2,0] * rhs.x + lhs[2,1] * rhs.y + lhs[2,2] * rhs.z + lhs[2,3] * 0
    return Vec3(x, y, z)
  }

  static func *(lhs: Matrix, rhs: Point) -> Point {
    let x = lhs[0,0] * rhs.x + lhs[0,1] * rhs.y + lhs[0,2] * rhs.z + lhs[0,3] * 1
    let y = lhs[1,0] * rhs.x + lhs[1,1] * rhs.y + lhs[1,2] * rhs.z + lhs[1,3] * 1
    let z = lhs[2,0] * rhs.x + lhs[2,1] * rhs.y + lhs[2,2] * rhs.z + lhs[2,3] * 1
    return Point(x, y, z)
  }

  static func translation(x: Double, y: Double, z: Double) -> Matrix {
    Matrix(with: [
      [1, 0, 0, x],
      [0, 1, 0, y],
      [0, 0, 1, z],
      [0, 0, 0, 1],
    ])
  }

  static func scaling(x: Double, y: Double, z: Double) -> Matrix {
    Matrix(with: [
      [x, 0, 0, 0],
      [0, y, 0, 0],
      [0, 0, z, 0],
      [0, 0, 0, 1],
    ])
  }

  static func rotateX(radians r: Double) -> Matrix {
    Matrix(with: [
      [1,     0,       0,  0],
      [0, cos(r), -sin(r), 0],
      [0, sin(r),  cos(r), 0],
      [0,     0,       0,  1],
    ])
  }

  static func rotateY(radians r: Double) -> Matrix {
    Matrix(with: [
      [ cos(r), 0, sin(r), 0],
      [     0,  1,     0,  0],
      [-sin(r), 0, cos(r), 0],
      [     0,  0,     0,  1],
    ])
  }

  static func rotateZ(radians r: Double) -> Matrix {
    Matrix(with: [
      [cos(r), -sin(r), 0, 0],
      [sin(r),  cos(r), 0, 0],
      [    0,       0,  1, 0],
      [    0,       0,  0, 1],
    ])
  }

  func transpose() -> Matrix {
    let r0 = [self[0,0], self[1,0], self[2,0], self[3,0]]
    let r1 = [self[0,1], self[1,1], self[2,1], self[3,1]]
    let r2 = [self[0,2], self[1,2], self[2,2], self[3,2]]
    let r3 = [self[0,3], self[1,3], self[2,3], self[3,3]]
    return Matrix(with: [r0, r1, r2, r3])
  }

  func determinant() -> Double {
    if self.data.count == 2 {
      return self[0, 0] * self[1, 1] - self[0, 1] * self[1, 0]
    } else {
      // To get the determinant of a matrix whose count is greater than 2:
      // Take each element of row 1 multiply it by its cofactor and then sum the products.
      return self.data[0].enumerated().reduce(0.0) { sum, pair in
        sum + pair.element * self.cofactor(row: 0, col: pair.offset)
      }

    }
  }

  func submatrix(row: Int, col: Int) -> Matrix {
    // look at each row and filter it out if it matches <row>
    // look at each row's values and filter it out if it matches <col>
    let rowFilter = self.data.enumerated().filter { i, _ in i != row}
    let colFilter = rowFilter.map { $0.element.enumerated().filter {i, _ in i != col}.map { $0.element } }
    return Matrix(with: colFilter)
  }

  func minor(row: Int, col: Int) -> Double {
    self.submatrix(row: row, col: col).determinant()
  }

  func cofactor(row: Int, col: Int) -> Double {
    minor(row: row, col:col) * ((row + col) % 2 == 0 ? 1 : -1)
  }

  func inverse() throws -> Matrix {
    guard isInvertible else { throw MatrixError.notInvertible }

    var M2 = Array(repeating: Array(repeating: 0.0, count: self.data[0].count), count: self.data.count)
    for row in M2.indices {
      for col in M2[row].indices {
        let c = self.cofactor(row: row, col: col)
        M2[col][row] = c / self.determinant()
      }
    }
    return Matrix(with: M2)
  }

}

enum MatrixError: Error {
  case notInvertible
}