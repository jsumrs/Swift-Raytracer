import Testing
@testable import RayTracer

struct IntersectionTests {

  @Test
  func aggregateIntersections() {
    let s = Sphere()
    let i1 = Intersection(t: 1, id: s.ID)
    let i2 = Intersection(t: 2, id: s.ID)
    let xs = Intersection.aggregate(intersections: i1, i2)
    #expect (xs.count == 2)
    #expect (xs[0].t == 1)
    #expect (xs[1].t == 2)
  }
}
