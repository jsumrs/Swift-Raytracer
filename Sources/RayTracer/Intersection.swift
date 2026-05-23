import Foundation

struct Intersection {
  let t: Double  // Where on the ray the object was intersected
  let id: UUID // Id of the object which was intersected

  static func aggregate(intersections: Intersection...) -> [Intersection] {
    intersections
  }
}
