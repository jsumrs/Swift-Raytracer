import Testing
@testable import RayTracer

struct RayTests {

  @Test
  func createRay() {
    let o = Point(1, 2, 3)
    let d = Vec3(4, 5, 6)
    let ray = Ray(origin: o, direction: d)

    #expect ( ray.origin == o )
    #expect ( ray.direction == d )
  }


  @Test
  func computePointFromDistance() {
    let r = Ray(origin: Point(2, 3, 4), direction: Vec3(1, 0, 0))
    #expect (r.position(time: 0) == Point(2, 3, 4))
    #expect (r.position(time: 1) == Point(3, 3, 4))
    #expect (r.position(time: -1) == Point(1, 3, 4))
    #expect (r.position(time: 2.5) == Point(4.5, 3, 4))
  }


  @Test
  func rayIntersectsSphereTwoPoints() {
    let r = Ray(origin: Point(0, 0, -5), direction: Vec3(0,0,1))
    let s = Sphere()
    let xs = s.intersect(ray: r)

    #expect (xs.count == 2)
    #expect (xs[0].t == 4.0)
    #expect (xs[1].t == 6.0)
  }


  @Test
  func rayIntersectsSphereAtTangent() {
    let r = Ray(origin: Point(0, 1, -5), direction: Vec3(0, 0, 1))
    let s = Sphere()
    let xs = s.intersect(ray: r)
    #expect (xs[0].t == xs[1].t)
  }


  @Test
  func rayIntersectsSphereFromWithin() {
    let r = Ray(origin: Point(0, 0, 0), direction: Vec3(0, 0, 1))
    let s = Sphere()
    let xs = s.intersect(ray: r)

    #expect (xs.count == 2)
    #expect (xs[0].t == -1.0)
    #expect (xs[1].t == 1.0)
  }

  
  @Test
  func rayIntersectsSphereFromOutside() {
    let r = Ray(origin: Point(0, 0, 5), direction: Vec3(0, 0, 1))
    let s = Sphere()
    let xs = s.intersect(ray: r)

    #expect (xs.count == 2)
    #expect (xs[0].t == -6.0)
    #expect (xs[1].t == -4.0)
  }


  @Test
  func translateRay() {
    let r = Ray(origin: Point(1, 2, 3), direction: Vec3(0, 1, 0))
    let m = Matrix.translation(x: 3, y: 4, z: 5)
    let r2 = m * r

    #expect ( r2.origin == Point(4, 6, 8))
    #expect ( r2.direction == Vec3(0, 1, 0))
  }

  @Test
  func scaleRay() {
    let r = Ray(origin: Point(1, 2, 3), direction: Vec3(0, 1, 0))
    let m = Matrix.scaling(x: 2, y: 3, z: 4)
    let r2 = m * r
    #expect ( r2.origin == Point(2, 6, 12) )
    #expect ( r2.direction == Vec3(0, 3, 0) )
  }

}
