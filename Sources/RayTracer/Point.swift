struct Point {
  let x, y, z : Double
  init(_ x: Double, _ y: Double, _ z: Double) {
    self.x = x
    self.y = y
    self.z = z
  }

  static func ==(lhs: Point, rhs: Point) -> Bool {
    Double.nearEqual(lhs.x, rhs.x) &&
    Double.nearEqual(lhs.y, rhs.y) &&
    Double.nearEqual(lhs.z, rhs.z)
  }

  static func +(lhs: Point, rhs: Vec3) -> Point {
    Point(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  static func +(lhs: Vec3, rhs: Point) -> Point {
    Point(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
  }

  static func -(lhs: Point, rhs: Point) -> Vec3 {
    Vec3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }

  static func -(lhs: Point, rhs: Vec3) -> Point {
    Point(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }

  static prefix func -(vec: Point) -> Point {
    Point(-vec.x, -vec.y, -vec.z)
  }

}