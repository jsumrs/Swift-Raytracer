import Testing
@testable import RayTracer

struct RayTracerChallengeTests {
  @Test func isPoint() {
    let a = RTTuple(4.3, -4.2, 3.1, 1.0)
    #expect(a.x == 4.3)
    #expect(a.y == -4.2)
    #expect(a.z == 3.1)
    #expect(a.w == 1.0)
    #expect(a.type == .point)
    #expect(a.type != .vector)
  }
  
  @Test func isVector() {
    let a = RTTuple(4.3, -4.2, 3.1, 0.0)
    #expect(a.x == 4.3)
    #expect(a.y == -4.2)
    #expect(a.z == 3.1)
    #expect(a.w == 0.0)
    #expect(a.type != .point)
    #expect(a.type == .vector)
  }
  
  @Test func makePoint() {
    let p = RTTuple.point(4, -4, 3)
    #expect (p == RTTuple(4, -4, 3, 1))
  }
  
  @Test func makeVector() {
    let v = RTTuple.vector(4, -4, 3)
    #expect (v == RTTuple(4, -4, 3, 0))
  }
  
  @Test func addTwoRTTuples() {
    let a1 = RTTuple(3, -2, 5, 1)
    let a2 = RTTuple(-2, 3, 1, 0)
    
    #expect (a1 + a2 == RTTuple(1, 1, 6, 1))
  }

  @Test func subtractTwoPoints() {
    let p1 = RTTuple.point(3, 2, 1) 
    let p2 = RTTuple.point(5, 6, 7)

    #expect (p1 - p2 == RTTuple.vector(-2, -4, -6))
  }

  @Test func subtractVectorFromPoint() {
    let p = RTTuple.point(3, 2, 1)
    let v = RTTuple.vector(5, 6, 7)

    #expect (p - v == RTTuple.point(-2, -4, -6))
  }

  @Test func subtractTwoVectors() {
    let v1 = RTTuple.vector(3, 2, 1)
    let v2 = RTTuple.vector(5, 6, 7)

    #expect (v1 - v2 == RTTuple.vector(-2, -4, -6))
  }

  @Test func subtractVectorFromZeroVector() {
    let zero = RTTuple.vector(0, 0, 0)
    let v = RTTuple.vector(1, -2, 3)

    #expect (zero - v == RTTuple.vector(-1, 2, -3))
  }

  @Test func negateTuple() {
    let a = RTTuple(1, -2, 3, -4)
    
    #expect (-a == RTTuple(-1, 2, -3, 4))
  }

  @Test func scaleTuple() {
    let a = RTTuple(1, -2, 3, -4)

    #expect (a * 3.5 == RTTuple(3.5, -7, 10.5, -14))
  }

  @Test func shrinkTuple() {
    let a = RTTuple(1, -2, 3, -4)

    #expect (a * 0.5 == RTTuple(0.5, -1, 1.5, -2))
  }

  @Test func divideTupleByScalar() {
    let a = RTTuple(1, -2, 3, -4)

    #expect (a / 2.0 == RTTuple(0.5, -1, 1.5, -2))
  }

  @Test func computeMagnitudeOfVector() {
    var v = RTTuple.vector(1, 0, 0)
    #expect (v.magnitude == 1.0)

    v = RTTuple.vector(0, 1, 0)
    #expect (v.magnitude == 1.0)

    v = RTTuple.vector(0, 0, 1)
    #expect (v.magnitude == 1.0)

    v = RTTuple.vector(1, 2, 3)
    #expect (v.magnitude == 14.0.squareRoot())

    v = RTTuple.vector(-1, -2, -3)
    #expect (v.magnitude == 14.0.squareRoot())
  }

  @Test func normalizeVector() {
    var v = RTTuple.vector(4, 0, 0)
    #expect (v.normalized() == RTTuple.vector(1, 0, 0))

    v = RTTuple.vector(1, 2, 3)
    #expect (v.normalized() == RTTuple.vector(1 / 14.0.squareRoot(), 2 / 14.0.squareRoot(), 3 / 14.0.squareRoot()))
  }

  @Test func magnitudeOfNormalizedVector() {
    let v = RTTuple.vector(1, 2, 3)
    let norm = v.normalized()

    #expect (norm.magnitude == 1.0)
  }


}
