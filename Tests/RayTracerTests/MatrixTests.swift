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
  func mismatchLengthEqualsCheckMat4x4() {
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

}