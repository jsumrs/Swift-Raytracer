struct Color {
  let r, g, b : Double

  func toPPM() -> String {
    let sourceRange = 0.0...1.0
    let targetRange = 0.0...255.0

    // Map and clamp to ensure we stay within 0-255
    let process = { (val: Double) -> Int in
      let mapped = remap(value: val, from: sourceRange, to: targetRange)
      let clamped = max(0, min(255, mapped))
      return Int(clamped.rounded())
    }

    return "\(process(r)) \(process(g)) \(process(b)) "
  }

  static func +(lhs: Color, rhs: Color) -> Color{
    Color(r: lhs.r + rhs.r, g: lhs.g + rhs.g, b: lhs.b + rhs.b)
  }

  static func -(lhs: Color, rhs: Color) -> Color{
    Color(r: lhs.r - rhs.r, g: lhs.g - rhs.g, b: lhs.b - rhs.b)
  }

  static func *(lhs: Color, rhs: Double) -> Color{
    Color(r: lhs.r * rhs, g: lhs.g * rhs, b: lhs.b * rhs)
  }

  static func *(lhs: Color, rhs: Color) -> Color{
    // Hadamard Product
    Color(r: lhs.r * rhs.r, g: lhs.g * rhs.g, b: lhs.b * rhs.b)
  }

  static func ==(lhs: Color, rhs: Color) -> Bool {
    Double.nearEqual(lhs.r, rhs.r) &&
    Double.nearEqual(lhs.g, rhs.g) &&
    Double.nearEqual(lhs.b, rhs.b)
  }

}