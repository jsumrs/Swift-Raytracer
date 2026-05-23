import Foundation

struct Sphere {
  let ID = UUID()

  static func ==(lhs: Sphere, rhs: Sphere) -> Bool {
    return lhs.ID == rhs.ID
  }

  static func !=(lhs: Sphere, rhs: Sphere) -> Bool {
    return !(lhs == rhs)
  }
}
