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


  @Test
  func computeHitWithIntersectionsPositiveTs() throws {
    let s = Sphere()
    let i1 = Intersection(t: 1, id: s.id)
    let i2 = Intersection(t: 2, id: s.id)
    let xs = Intersection.aggregate(intersections: i1, i2)
    let i = try #require(Intersection.hit(from: xs), "Intersections does not contain a positive intersection")
    #expect (i == i1)
  }


  @Test
  func computeHitWithIntersectionsSomeNegative() throws {
    let s = Sphere()
    let i1 = Intersection(t: -1, id: s.id)
    let i2 = Intersection(t: 1, id: s.id)
    let xs = Intersection.aggregate(intersections: i1, i2)
    let i = try #require(Intersection.hit(from: xs), "Intersections does not contain a positive intersection")
    #expect (i == i2)
  }

  
  @Test
  func computeHitWithIntersectionsAllNegative() throws {
    let s = Sphere()
    let i1 = Intersection(t: -2, id: s.id)
    let i2 = Intersection(t: -1, id: s.id)
    let xs = Intersection.aggregate(intersections: i1, i2)
    let i = Intersection.hit(from: xs)
    #expect (i == nil)
  }

  
  @Test
  func computeHitWithIntersectionsAlwaysLowestNonNegative() throws {
    let s = Sphere()
    let i1 = Intersection(t: 5, id: s.id)
    let i2 = Intersection(t: 7, id: s.id)
    let i3 = Intersection(t: -3, id: s.id)
    let i4 = Intersection(t: 2, id: s.id)
    let xs = Intersection.aggregate(intersections: i1, i2, i3, i4)
    let i = try #require(Intersection.hit(from: xs), "Intersections does not contain a positive intersection")
    #expect (i == i4)
  }
}
