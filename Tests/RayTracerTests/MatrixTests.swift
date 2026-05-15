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
}