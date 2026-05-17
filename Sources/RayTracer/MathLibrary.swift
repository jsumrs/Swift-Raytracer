func remap<T: FloatingPoint>(value: T, from: ClosedRange<T>, to: ClosedRange<T>) -> T {
  // Source - https://stackoverflow.com/a/42817527
  // Posted by David Berry, modified by community. See post 'Timeline' for change history
  // Retrieved 2026-05-11, License - CC BY-SA 3.0
  return to.lowerBound + (to.upperBound - to.lowerBound) * (value - from.lowerBound) / (from.upperBound - from.lowerBound)
}

extension Double {
  static func nearEqual(_ lhs: Double, _ rhs: Double, epsilon: Double = 0.00001) -> Bool {
    abs(lhs - rhs) < epsilon
  }
}