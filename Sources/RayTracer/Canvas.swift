import Foundation 

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

  func toPPM() -> String {
    var s = """
                    P3
                    \(width) \(height)
                    255

                    """
    for row in pixels {
      var currentLine = ""
      for pixel in row {
        let ppm = pixel.toPPM()
        let separator = currentLine.isEmpty ? "" : " "
        if currentLine.count + separator.count + ppm.count > 70 {
          s.append(currentLine + "\n")
          currentLine = ppm
        } else {
          currentLine += separator + ppm
        }
      }
      if !currentLine.isEmpty {
        s.append(currentLine + "\n")
      }
    }
    return s
  }

  func saveToDisk() {
    let formatter = ISO8601DateFormatter()
    let filename = formatter.string(from: Date()) + ".ppm"
    let fileURL = URL(fileURLWithPath: "Output/" + filename)
    do {
      try toPPM().write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
      print("Unable to write to file: \(error)")
    }
    

  }
}