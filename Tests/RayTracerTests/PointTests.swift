import Testing
@testable import RayTracer

struct PointTests {
  @Test 
  func makePoint() {
    let p = Point(4, -4, 3)
    #expect (p == Point(4, -4, 3))
  }
  

  @Test 
  func subtractTwoPoints() {
    let p1 = Point(3, 2, 1) 
    let p2 = Point(5, 6, 7)
    #expect (p1 - p2 == Vec3(-2, -4, -6))
  }
  

  @Test 
  func subtractVectorFromPoint() {
    let p = Point(3, 2, 1)
    let v = Vec3(5, 6, 7)
    #expect (p - v == Point(-2, -4, -6))
  }


}