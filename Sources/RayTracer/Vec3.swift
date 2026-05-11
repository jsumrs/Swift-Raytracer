struct Vec3 {
  let x, y, z : Double
  var magnitude: Double {
    (x * x + y * y + z * z).squareRoot()
  }

  init(_ x: Double, _ y: Double, _ z: Double) {
    self.x = x
    self.y = y
    self.z = z
  }

  func normalized() -> Vec3 {
    Vec3(x / magnitude, y / magnitude, z / magnitude)
  }

  static func dot(_ a: Vec3, _ b: Vec3) -> Double {
    (a.x * b.x) + 
    (a.y * b.y) +
    (a.z * b.z)
  }

  static func cross(_ a: Vec3, _ b: Vec3) -> Vec3 {
    Vec3(a.y * b.z - a.z * b.y,
         a.z * b.x - a.x * b.z, 
         a.x * b.y - a.y * b.x)
  }

  static func ==(lhs: Vec3, rhs: Vec3) -> Bool {
    Double.nearEqual(lhs.x, rhs.x) &&
    Double.nearEqual(lhs.y, rhs.y) &&
    Double.nearEqual(lhs.z, rhs.z)
  }

  static func +(lhs: Vec3, rhs: Vec3) -> Vec3 {
    Vec3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  static func -(lhs: Vec3, rhs: Vec3) -> Vec3 {
    Vec3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }

  static func *(lhs: Vec3, rhs: Double) -> Vec3 {
    Vec3(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
  }

  static func /(lhs: Vec3, rhs: Double) -> Vec3 {
    Vec3(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
  }

  static prefix func -(tuple: Vec3) -> Vec3 {
    Vec3(-tuple.x, -tuple.y, -tuple.z)
  }

}

extension Double {
  static func nearEqual(_ lhs: Double, _ rhs: Double, epsilon: Double = 0.00001) -> Bool {
      abs(lhs - rhs) < epsilon
  }
}