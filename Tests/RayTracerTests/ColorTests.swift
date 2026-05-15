import Testing
@testable import RayTracer

struct ColorTests {
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
}