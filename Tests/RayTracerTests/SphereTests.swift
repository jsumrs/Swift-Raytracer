import Testing
@testable import RayTracer

struct SphereTests {

  @Test
  func spheresAreUnique() {
    let s1 = Sphere()
    let s2 = Sphere()
    #expect (s1 != s2)
  }

  
  @Test
  func sphereDefaultTransformation() {
    #expect ( Sphere().transform == Matrix.identity4x4 )
  }


  @Test
  func sphereNonDefaultTransform() {
    let t = Matrix.translation(x: 2, y: 3, z: 4)
    #expect ( Sphere(with: t).transform == t )
  }
}
