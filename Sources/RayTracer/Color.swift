struct Color {
  let r, g, b : Double

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