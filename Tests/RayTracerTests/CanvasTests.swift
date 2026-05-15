import Testing
@testable import RayTracer

struct CanvasTests {
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
  func canvasToPPMcheckHeader() {
    let c = Canvas(width: 5, height: 3)
    let header = c.toPPM().split(separator: "\n").prefix(3).map(String.init)
    let expectant = ["P3", "\(c.width) \(c.height)", "255"]
    #expect (Array(header) == expectant)
  }


  @Test
  func canvasToPPM() {
    var c = Canvas(width: 5, height: 3)
    let c1 = Color(r: 1.5, g: 0, b: 0)
    let c2 = Color(r: 0, g: 0.5, b: 0)
    let c3 = Color(r: -0.5, g: 0, b: 1)
    c[0, 0] = c1
    c[2, 1] = c2
    c[4, 2] = c3
    let ppm = c.toPPM()
    let expectant = """
      P3
      5 3
      255
      255 0 0 0 0 0 0 0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 128 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 0 0 0 0 0 0 255

      """
    #expect (ppm == expectant)
  }

  @Test
  func canvasToPPMSplitLongLines() {
    let c = Canvas(width: 10, height: 2, background: Color(r: 1, g: 0.8, b: 0.6))
    let expected = """
                   P3
                   10 2
                   255
                   255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
                   255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
                   255 204 153 255 204 153 255 204 153 255 204 153 255 204 153
                   255 204 153 255 204 153 255 204 153 255 204 153 255 204 153

                   """
    
    #expect (c.toPPM() == expected)
  }


  @Test
  func canvasToPPMEndsInNewline() {
    let c = Canvas(width: 5, height: 3)
    let ppm = c.toPPM()
    #expect (String(ppm.last!) == "\n")
  }
  

}