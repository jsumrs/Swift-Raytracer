struct Ray {
  let origin: Point
  let direction: Vec3

  func position(time t: Double) -> Point {
    return origin + (direction * t)
  }
}
