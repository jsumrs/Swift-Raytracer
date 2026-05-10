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
  
  @Test func addRTTuples() {
    let a1 = RTTuple(3, -2, 5, 1)
    let a2 = RTTuple(-2, 3, 1, 0)
    
    #expect (a1 + a2 == RTTuple(1, 1, 6, 1))
  }

}
