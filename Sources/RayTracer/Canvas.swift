struct Canvas {
  let width, height : Int
  let background : Color
  private var pixels: [[Color]]

  init(width: Int, height: Int, background: Color = Color(r: 0, g: 0, b: 0)){
    self.width = width
    self.height = height
    self.background = background
    self.pixels = Array(repeating: Array(repeating: background, count: width), count: height)
  }

  private func isInBounds(x: Int, y: Int) -> Bool {
    x >= 0 && x < width && y >= 0 && y < height  
  }

  subscript(x: Int, y: Int) -> Color {
    get { 
      assert(isInBounds(x: x, y: y), "ERROR: Index out of bounds. Canvas size (w:\(width), h:\(height) Pixel: (\(x), \(y))")
      return pixels[y][x] 
    }
    set { 
      assert(isInBounds(x: x, y: y), "ERROR: Index out of bounds. Canvas size (w:\(width), h:\(height) Pixel: (\(x), \(y))")
      pixels[y][x] = newValue 
    }
  }

  func getPPMString() -> String {
    var s = """
                    P3
                    \(width) \(height)
                    255
                    """
    var counter = 0
    for row in pixels {
      for pixel in row {
        let ppm = pixel.toPPM()
        counter += ppm.count
        
        // plain ppm file lines can't exceed 70.
        if counter >= 70 {
          s.append("\n")
          counter %= 70
        }
        s.append(ppm)
      }
    }
    return s

  }
}