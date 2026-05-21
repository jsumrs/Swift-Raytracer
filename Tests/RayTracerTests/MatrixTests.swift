import Testing
@testable import RayTracer

struct MatrixTests {
  @Test
  func createMat2x2() {
    let data = [
      [ -3.0,  5.0],
      [  1.0, -2.0],
    ]
    let m = Matrix(with: data)

    #expect (m[0, 0] == -3)
    #expect (m[0, 1] ==  5)
    #expect (m[1, 0] ==  1)
    #expect (m[1, 1] == -2)
  }
  

  @Test
  func createMat3x3() {
    let data = [
      [ -3.0,  5.0,  0],
      [  1.0, -2.0, -7],
      [  0.0,  1.0,  1]
    ]
    let m = Matrix(with: data)

    #expect (m[0, 0] == -3)
    #expect (m[1, 1] == -2)
    #expect (m[2, 2] ==  1)
  }


  @Test
  func createMat4x4() {
    let data = [
      [   1,    2,    3,    4],
      [ 5.5,  6.5,  7.5,  8.5],
      [   9,   10,   11,   12],
      [13.5, 14.5, 15.5, 16.5]
    ]
    let m = Matrix(with: data)

    #expect (m[0,0] == 1)
    #expect (m[0,3] == 4)
    #expect (m[1,0] == 5.5)
    #expect (m[1,2] == 7.5)
    #expect (m[2,2] == 11)
    #expect (m[3,0] == 13.5)
    #expect (m[3,2] == 15.5)
  }

  
  @Test
  func equalsCheckMat4x4() {
    let dataA: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 9, 8, 7, 6],
      [ 5, 4, 3, 2],
    ]
    let dataB: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 9, 8, 7, 6],
      [ 5, 4, 3, 2],
    ]
    let a = Matrix(with: dataA)
    let b = Matrix(with: dataB)

    #expect (a == b)
  }

  
  @Test
  func mismatchElementsEqualsCheckMat4x4() {
    let dataA: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 1, 1, 1, 6],
      [ 5, 4, 3, 2],
    ]
    let dataB: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 9, 8, 7, 6],
      [ 5, 4, 3, 2],
    ]
    let a = Matrix(with: dataA)
    let b = Matrix(with: dataB)

    #expect (a != b)
  }


  @Test
  func outerMismatchLengthEqualsCheckMat4x4() {
    let dataA: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 1, 1, 1, 6],
    ]
    let dataB: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 9, 8, 7, 6],
      [ 5, 4, 3, 2],
    ]
    let a = Matrix(with: dataA)
    let b = Matrix(with: dataB)

    #expect (a != b)
  }


  @Test
  func innerMismatchLengthEqualsCheckMat4x4() {
    let dataA: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 1, 1, 1, 6],
    ]
    let dataB: [[Double]] = [
      [ 1, 2, 3, 4],
      [ 5, 6, 7, 8],
      [ 1, 1, 1],
    ]
    let a = Matrix(with: dataA)
    let b = Matrix(with: dataB)

    #expect (a != b)
  }


  @Test
  func multiplyTwoMat4x4() {
    let a = Matrix(with: [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 8, 7, 6],
      [5, 4, 3, 2]
    ])

    let b = Matrix(with: [
      [-2,  1,  2,  3],
      [ 3,  2,  1, -1],
      [ 4,  3,  6,  5],
      [ 1,  2,  7,  8],
    ])

    let c = Matrix(with: [
      [ 20,  22,  50,  48],
      [ 44,  54, 114, 108],
      [ 40,  58, 110, 102],
      [ 16,  26,  46,  42],
    ])

    #expect (a * b == c)
  }


  @Test
  func multiplyMat4x4ByPoint() {
    let a = Matrix(with: [
      [1, 2, 3, 4],
      [2, 4, 4, 2],
      [8, 6, 4, 1],
      [0, 0, 0, 1]
    ])
    let b = Point(1, 2, 3)
    let c = Point(18, 24, 33)

    #expect(a * b == c)
  }


  @Test
  func multiplyMat4x4ByIdentity() {
    let a = Matrix(with: [
      [0, 1, 2, 4],
      [1, 2, 4, 8],
      [2, 4, 8,16],
      [4, 8,16,32],
    ])

    #expect( a * Matrix.identity4x4 == a)
  }


  @Test
  func transposeMat4x4() {
    let a = Matrix(with: [
      [0, 9, 3, 0],
      [9, 8, 0, 8],
      [1, 8, 5, 3],
      [0, 0, 5, 8],
    ])
    let b = Matrix(with: [
      [0,9,1,0],
      [9,8,8,0],
      [3,0,5,5],
      [0,8,3,8],
    ])

    #expect(a.transpose() == b)
  }


  @Test
  func transposeMatIdentity() {
    #expect(Matrix.identity4x4 == Matrix.identity4x4.transpose())
  }


  @Test 
  func determinantOfMat2x2() {
    let a = Matrix(with: [
      [ 1, 5],
      [-3, 2],
    ])

    #expect (a.determinant() == 17.0)
  }


  @Test 
  func submatrix3x3() {
    let a = Matrix(with: [
      [1, 5, 0],
      [-3,2,7],
      [0,6,-3],
    ])
    let b = Matrix(with:[
      [-3, 2],
      [0, 6],
    ])

    #expect (a.submatrix(row: 0, col: 2) == b)
  }


  @Test
  func submatrix4x4() {
    let a = Matrix(with: [
      [-6, 1, 1, 6],
      [-8, 5, 8, 6],
      [-1, 0, 8, 2],
      [-7, 1, -1, 1],
    ])
    let b = Matrix(with: [
      [-6, 1, 6],
      [-8, 8, 6],
      [-7, -1, 1],
    ])

    #expect (a.submatrix(row: 2, col: 1) == b)
  }


  @Test
  func minor4x4() {
    let a = Matrix(with: [
      [3, 5, 0],
      [2, -1, -7],
      [6, -1, 5],
    ])
    let b = a.submatrix(row: 1, col: 0)
    
    #expect (b.determinant() == 25)
    #expect (a.minor(row: 1, col: 0) == 25)
  }

  
  @Test
  func cofactor3x3() {
    let a = Matrix(with: [
      [3, 5, 0],
      [2, -1, -7],
      [6, -1, 5],
    ])
    #expect (a.minor(row: 0, col: 0) == -12)
    #expect (a.cofactor(row: 0, col: 0) == -12)

    #expect (a.minor(row: 1, col: 0) == 25)
    #expect (a.cofactor(row: 1, col: 0) == -25)
  }

  
  @Test
  func determinant3x3() {
    let a = Matrix(with: [
      [1, 2, 6],
      [-5, 8, -4],
      [2, 6, 4]
    ])

    #expect (a.cofactor(row: 0, col: 0) == 56)
    #expect (a.cofactor(row: 0, col: 1) == 12)
    #expect (a.cofactor(row: 0, col: 2) == -46)
    #expect (a.determinant() == -196)
  }

  
  @Test
  func determinant4x4() {
    let a = Matrix(with: [
      [-2, -8, 3, 5],
      [-3, 1, 7, 3],
      [1, 2, -9, 6],
      [-6, 7, 7, -9],
    ])

    #expect(a.cofactor(row: 0, col: 0) == 690)
    #expect(a.cofactor(row: 0, col: 1) == 447)
    #expect(a.cofactor(row: 0, col: 2) == 210)
    #expect(a.cofactor(row: 0, col: 3) == 51)
    #expect(a.determinant() == -4071)
  }


  @Test
  func invertibility4x4() {
    let a = Matrix(with: [
      [6, 4, 4, 4],
      [5, 5, 7, 6],
      [4, -9, 3, -7],
      [9, 1, 7, -6],
    ])
    #expect (a.determinant() == -2120)
    #expect (a.isInvertible == true)

    let b = Matrix(with: [
      [-4, 2, -2, -3],
      [9, 6, 2, 6],
      [0, -5, 1, -5],
      [0, 0, 0, 0],
    ])
    #expect (b.determinant() == 0)
    #expect (b.isInvertible == false)
  }


  @Test
  func invert4x4() {
    let a = Matrix(with: [
      [-5, 2, 6, -8],
      [1, -5, 1, 8],
      [7, 7, -6, -7],
      [1, -3, 7, 4],
    ])
    let b = try! a.inverse()

    #expect (a.determinant() == 532)
    #expect (a.cofactor(row: 2, col: 3) == -160)
    #expect (b[3, 2] == -160.0/532.0)
    #expect (a.cofactor(row: 3, col: 2) == 105)
    #expect (b[2, 3] == 105.0/532.0)

    let c = Matrix(with: [
      [0.21805, 0.45113, 0.24060, -0.04511],
      [-0.80827, -1.45677, -0.44361, 0.52068],
      [-0.07895, -0.22368, -0.05263, 0.19737],
      [-0.52256, -0.81391, -0.30075, 0.30639],
    ])
    #expect (b == c)
  }


  @Test
  func invert4x4Second() {
    let a = Matrix(with: [
      [8, -5, 9, 2],
      [7, 5, 6, 1],
      [-6, 0, 9, 6],
      [-3, 0, -9, -4],
    ])
    let b = Matrix(with: [
      [-0.15385, -0.15385, -0.28205, -0.53846],
      [-0.07692, 0.12308, 0.02564, 0.03077],
      [0.35897, 0.35897, 0.43590, 0.92308],
      [-0.69231, -0.69231, -0.76923, -1.92308],
    ])
    #expect(try! a.inverse() == b)
  }


  @Test
  func invert4x4Third() {
    let a = Matrix(with: [
      [9, 3, 0, 9],
      [-5, -2, -6, -3],
      [-4, 9, 6, 4],
      [-7, 6, 6, 2],
    ])
    let b = Matrix(with: [
      [-0.04074, -0.07778, 0.14444, -0.22222],
      [-0.07778, 0.03333, 0.36667, -0.33333],
      [-0.02901, -0.14630, -0.10926, 0.12963],
      [0.17778, 0.06667, -0.26667, 0.33333],
    ])
    #expect(try! a.inverse() == b)
  }


  @Test
  func multiplyProductByInverse() {
    let a = Matrix(with: [
      [3, -9, 7, 3],
      [3, -8, 2, -9],
      [-4, 4, 4, 1],
      [-6, 5, -1, 1],
    ])
    let b = Matrix(with: [
      [8, 2, 2, 2],
      [3, -1, 7, 0],
      [7, 0, 5, 4],
      [6, -2, 0, 5],
    ])
    let c = a * b
    #expect(try! c * b.inverse() == a)
  }

  
  @Test
  func translatePointByMatrix() {
    let t = Matrix.translation(x: 5, y: -3, z: 2)
    let p = Point(-3, 4, 5) 
    #expect (t * p == Point(2, 1, 7))
  }


  @Test
  func translationPointByInverseMatrix() {
    let t = Matrix.translation(x: 5, y: -3, z: 2)
    let i = try! t.inverse()
    let p = Point(-3, 4, 5) 
    #expect (i * p == Point(-8, 7, 3))
  }


  @Test
  func translationVector() {
    let t = Matrix.translation(x: 5, y: -3, z: 2)
    let v = Vec3(-3, 4, 5)
    #expect (t * v == v)
  }


  @Test
  func scalePointByMatrix() {
    let s = Matrix.scaling(x: 2, y: 3, z: 4)
    let p = Point(-4, 6, 8)
    #expect (s * p == Point(-8, 18, 32))
  }


  @Test
  func scaleVectorByMatrix() {
    let s = Matrix.scaling(x: 2, y: 3, z: 4)
    let v = Vec3(-4, 6, 8)
    #expect (s * v == Vec3(-8, 18, 32))
  }
  

  @Test
  func scaleVectorByInverseMatrix() {
    let s = Matrix.scaling(x: 2, y: 3, z: 4)
    let i = try! s.inverse()
    let v = Vec3(-4, 6, 8)
    #expect (i * v == Vec3(-2, 2, 2))
  }


  @Test
  func reflectionIsScaleByNegative() {
    let t = Matrix.scaling(x: -1, y: 1, z: 1)
    let p = Point(2, 3, 4)
    #expect (t * p == Point(-2, 3, 4))
  }


  @Test
  func rotatePointAroundXaxis() {
    let p = Point(0, 1, 0)
    let eighth = Matrix.xRotation(by: Double.pi / 4.0)
    let quarter = Matrix.xRotation(by: Double.pi / 2.0)
    #expect (eighth * p == Point(0, 2.squareRoot()/2.0, 2.squareRoot()/2.0))
    #expect (quarter * p == Point(0, 0, 1))
  }


  @Test
  func rotateInverselyPointAroundXaxis() {
    let p = Point(0, 1, 0)
    let eighth = Matrix.xRotation(by: Double.pi / 4.0)
    let inverse = try! eighth.inverse()
    #expect (inverse * p == Point(0, 2.squareRoot()/2.0,  -2.squareRoot()/2.0))
  }
}
  

  @Test
  func rotatePointAroundYaxis() {
    let p = Point(0, 0, 1)
    let eighth = Matrix.yRotation(by: Double.pi / 4.0)
    let quarter = Matrix.yRotation(by: Double.pi / 2.0)
    #expect (eighth * p == Point(2.squareRoot()/2.0, 0, 2.squareRoot()/2.0))
    #expect (quarter * p == Point(1, 0, 0))
  }

  
  @Test
  func rotatePointAroundZaxis() {
    let p = Point(0, 1, 0)
    let eighth = Matrix.zRotation(by: Double.pi / 4.0)
    let quarter = Matrix.zRotation(by: Double.pi / 2.0)
    #expect (eighth * p == Point(-2.squareRoot()/2.0, 2.squareRoot()/2.0, 0))
    #expect (quarter * p == Point(-1, 0, 0))
  }

  @Test
  func shearingTransformations() {
    let p = Point(2, 3, 4)

    let xy = Matrix.shearing(xToY: 1)
    let xz = Matrix.shearing(xToZ: 1)
    let yx = Matrix.shearing(yToX: 1)
    let yz = Matrix.shearing(yToZ: 1)
    let zx = Matrix.shearing(zToX: 1)
    let zy = Matrix.shearing(zToY: 1)

    #expect (xy * p == Point(5, 3, 4))
    #expect (xz * p == Point(6, 3, 4))
    #expect (yx * p == Point(2, 5, 4))
    #expect (yz * p == Point(2, 7, 4))
    #expect (zx * p == Point(2, 3, 6))
    #expect (zy * p == Point(2, 3, 7))
  }

  @Test
  func transformationsInSequence() {
    let p = Point(1, 0, 1)
    let A = Matrix.xRotation(by: Double.pi / 2.0)
    let B = Matrix.scaling(x: 5, y: 5, z: 5)
    let C = Matrix.translation(x: 10, y: 5, z: 7)

    let p2 = A * p
    #expect (p2 == Point(1, -1, 0))

    let p3 = B * p2
    #expect (p3 == Point(5, -5, 0))

    let p4 = C * p3
    #expect (p4 == Point(15, 0, 7))
  }

  @Test
  func chainedTransformsInReverseOrder() {
    let p = Point(1, 0, 1)
    let A = Matrix.xRotation(by: Double.pi / 2.0)
    let B = Matrix.scaling(x: 5, y: 5, z: 5)
    let C = Matrix.translation(x: 10, y: 5, z: 7)
    let T = C * B * A
    #expect (T * p == Point(15, 0, 7))
  }
