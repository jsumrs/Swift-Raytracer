import Testing
@testable import RayTracer

struct RayTracerChallengeTests {
  @Test 
  func makePoint() {
    let p = Point(4, -4, 3)
    #expect (p == Point(4, -4, 3))
  }

  
  @Test 
  func makeVector() {
    let v = Vec3(4, -4, 3)
    #expect (v == Vec3(4, -4, 3))
  }

  
  @Test 
  func addTwoVec3() {
    let a1 = Vec3(3, -2, 5)
    let a2 = Vec3(-2, 3, 1)
    #expect (a1 + a2 == Vec3(1, 1, 6))
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


  @Test func subtractTwoVectors() {
    let v1 = Vec3(3, 2, 1)
    let v2 = Vec3(5, 6, 7)
    #expect (v1 - v2 == Vec3(-2, -4, -6))
  }


  @Test 
  func subtractVectorFromZeroVector() {
    let zero = Vec3(0, 0, 0)
    let v = Vec3(1, -2, 3)
    #expect (zero - v == Vec3(-1, 2, -3))
  }


  @Test 
  func negateVec3() {
    let a = Vec3(1, -2, 3)
    #expect (-a == Vec3(-1, 2, -3))
  }


  @Test 
  func scaleVec3() {
    let a = Vec3(1, -2, 3)
    #expect (a * 3.5 == Vec3(3.5, -7, 10.5))
  }


  @Test 
  func shrinkTuple() {
    let a = Vec3(1, -2, 3)
    #expect (a * 0.5 == Vec3(0.5, -1, 1.5))
  }


  @Test 
  func divideTupleByScalar() {
    let a = Vec3(1, -2, 3)
    #expect (a / 2.0 == Vec3(0.5, -1, 1.5))
  }


  @Test 
  func computeMagnitudeOfVector() {
    var v = Vec3(1, 0, 0)
    #expect (v.magnitude == 1.0)

    v = Vec3(0, 1, 0)
    #expect (v.magnitude == 1.0)

    v = Vec3(0, 0, 1)
    #expect (v.magnitude == 1.0)

    v = Vec3(1, 2, 3)
    #expect (v.magnitude == 14.0.squareRoot())

    v = Vec3(-1, -2, -3)
    #expect (v.magnitude == 14.0.squareRoot())
  }


  @Test 
  func normalizeVector() {
    var v = Vec3(4, 0, 0)
    #expect (v.normalized() == Vec3(1, 0, 0))

    v = Vec3(1, 2, 3)
    #expect (v.normalized() == Vec3(1 / 14.0.squareRoot(), 2 / 14.0.squareRoot(), 3 / 14.0.squareRoot()))
  }


  @Test 
  func magnitudeOfNormalizedVector() {
    let v = Vec3(1, 2, 3)
    let norm = v.normalized()
    #expect (norm.magnitude == 1.0)
  }


  @Test 
  func dotProductOfTwoTuples() {
    let a = Vec3(1, 2, 3)
    let b = Vec3(2, 3, 4)
    #expect (Vec3.dot(a, b) == 20.0)
  }


  @Test 
  func crossProductOfTwoVectors() {
    let a = Vec3(1, 2, 3)
    let b = Vec3(2, 3, 4)
    #expect (Vec3.cross(a, b) == Vec3(-1, 2, -1))
    #expect (Vec3.cross(b, a) == Vec3(1, -2, 1))
  }


  @Test 
  func makeColor() {
    let c = Color(r: -0.5, g: 0.4, b: 1.7)
    #expect (c.r == -0.5)
    #expect (c.g ==  0.4)
    #expect (c.b ==  1.7)
  }


  @Test 
  func addColors() {
    let c1 = Color(r: 0.9, g: 0.6, b: 0.75)
    let c2 = Color(r: 0.7, g: 0.1, b: 0.25)
    #expect (c1 + c2 == Color(r: 1.6, g: 0.7, b: 1.0))
  }


  @Test
  func subtractColors() {
    let c1 = Color(r: 0.9, g: 0.6, b: 0.75)
    let c2 = Color(r: 0.7, g: 0.1, b: 0.25)
    #expect (c1 - c2 == Color(r: 0.2, g: 0.5, b: 0.5))
  }


  @Test
  func scaleColor() {
    let c = Color(r: 0.2, g: 0.3, b: 0.4)
    #expect (c * 2 == Color(r: 0.4, g: 0.6, b: 0.8))
  }

  @Test
  func multiplyColors() {
    let c1 = Color(r: 1, g: 0.2, b: 0.4)
    let c2 = Color(r: 0.9, g: 1, b: 0.1)
    #expect (c1 * c2 == Color(r: 0.9, g: 0.2, b: 0.04))
  }

  @Test
  func createCanvas() {
    let c = Canvas(width: 10, height: 20)
    #expect (c.width == 10)
    #expect (c.height == 20)
    #expect (c.background == Color(r: 0, g: 0, b: 0))
  }


  @Test
  func writePixelToCanvas() {
    var c = Canvas(width: 10, height: 20)
    let red = Color(r: 1, g: 0, b: 0)
    c[2, 3] = red
    #expect (c[2, 3] == Color(r: 1, g: 0, b: 0))
  }


  @Test
  func canvasToPPM() {
    let c = Canvas(width: 5, height: 3)
    let header = c.getPPMString().split(separator: "\n").prefix(3).map(String.init)
    let expectant = ["P3", "\(c.width) \(c.height)", "255"]
    #expect (Array(header) == expectant)
  }


}
