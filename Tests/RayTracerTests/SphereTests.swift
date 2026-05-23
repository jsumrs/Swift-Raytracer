import Testing
@testable import RayTracer

struct SphereTests {

  @Test
  func spheresAreUnique() {
    let s1 = Sphere()
    let s2 = Sphere()
    #expect (s1 != s2)
  }
}
