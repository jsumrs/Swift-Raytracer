struct Matrix {
  let data: [[Double]]
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

}