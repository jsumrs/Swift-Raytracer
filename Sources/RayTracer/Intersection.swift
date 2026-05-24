import Foundation

struct Intersection {
  let t: Double  // Where on the ray the object was intersected
  let id: UUID // Id of the object which was intersected

  static func ==(lhs: Intersection, rhs: Intersection) -> Bool {
    lhs.id == rhs.id && lhs.t == rhs.t
  }

  static func aggregate(intersections: Intersection...) -> [Intersection] {
    intersections.sorted { $0.t < $1.t }
  }

  static func hit(from intersections: [Intersection]) -> Intersection? {
    // Assumes intersections is sorted.
    for i in intersections {
      if i.t >= 0 {
        return i
      }
    }
    // No positive intersection in intersections
    return nil
  }

}
