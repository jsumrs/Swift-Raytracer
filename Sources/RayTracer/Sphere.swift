import Foundation

struct Sphere {
  let ID = UUID()


  static func ==(lhs: Sphere, rhs: Sphere) -> Bool {
    return lhs.ID == rhs.ID
  }

  static func !=(lhs: Sphere, rhs: Sphere) -> Bool {
    return !(lhs == rhs)
  }

  private func coefficients(of ray: Ray) -> (a: Double, b: Double, c: Double) {
    let sphere_to_ray = ray.origin - Point(0, 0, 0)
    let a = Vec3.dot(ray.direction, ray.direction)
    let b = 2 * Vec3.dot(ray.direction, sphere_to_ray)    
    let c = Vec3.dot(sphere_to_ray, sphere_to_ray) - 1
    return (a, b, c)
  }

  func discriminant(ray: Ray) -> Double {
    let cfs = coefficients(of: ray)
    let (a, b, c) = (cfs.a, cfs.b, cfs.c)
    return (b * b) - 4 * a * c
  }

  func intersect(ray: Ray) -> [Double] {
    let disc = discriminant(ray: ray)
    guard disc >= 0 else { return [] }
    let root = disc.squareRoot()
    let (a, b, _) = coefficients(of: ray)
    let t1 = (-b - root) / (2 * a)
    let t2 = (-b + root) / (2 * a)
    return t1 < t2 ? [t1, t2] : [t2, t1]

  }

}
