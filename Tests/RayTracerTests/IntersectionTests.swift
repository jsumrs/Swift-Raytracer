import Testing
@testable import RayTracer

struct IntersectionTests {

  @Test
  func aggregateIntersections() {
    let s = Sphere()
    let i1 = Intersection(t: 1, id: s.id)
    let i2 = Intersection(t: 2, id: s.id)
    let xs = Intersection.aggregate(intersections: i1, i2)
    #expect (xs.count == 2)
    #expect (xs[0].t == 1)
    #expect (xs[1].t == 2)
  }


  @Test
  func intersectSetsObjectOnIntersection() {
    let r = Ray(origin: Point(0, 0, -5), direction: Vec3(0, 0, 1))
    let s = Sphere()
    let xs = s.intersect(ray: r)
    #expect (xs.count == 2)
    #expect (xs[0].id == s.id)
    #expect (xs[1].id == s.id)
  }
}
