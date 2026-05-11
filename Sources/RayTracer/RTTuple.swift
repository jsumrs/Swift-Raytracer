import Foundation

enum RTTupleType {
  case point, vector
}

struct RTTuple {
  let x: Double
  let y: Double
  let z: Double
  let w: Double
  let type: RTTupleType // For the sake of following the book, we store type info here...
  
  var magnitude: Double {
    let pyth = self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w
    return pyth.squareRoot()
  }
  
  init(_ x: Double, _ y: Double, _ z: Double, _ w: Double) {
    self.x = x
    self.y = y
    self.z = z
    self.w = w
    self.type = w == 1.0 ? .point : .vector // ew i hate this, remove later and refactor points and vectors out...
  }

  func normalized() -> RTTuple {
    RTTuple(x / magnitude, y / magnitude, z / magnitude, w / magnitude)
  }
  
  static func point(_ x: Double, _ y: Double, _ z: Double) -> RTTuple {
    RTTuple(x, y, z, 1.0)
  }

  static func vector(_ x: Double, _ y: Double, _ z: Double) -> RTTuple {
    RTTuple(x, y, z, 0.0)
  }

  static func dot(_ a: RTTuple, _ b: RTTuple) -> Double {
    (a.x * b.x) + 
    (a.y * b.y) +
    (a.z * b.z) +
    (a.w * b.w)
  }
  
  static func ==(lhs: RTTuple, rhs: RTTuple) -> Bool {
    lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z &&
    lhs.w == rhs.w
  }
  
  static func +(lhs: RTTuple, rhs: RTTuple) -> RTTuple {
    RTTuple(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
  }

  static func -(lhs: RTTuple, rhs: RTTuple) -> RTTuple {
    RTTuple(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
  }

  static prefix func -(tuple: RTTuple) -> RTTuple {
    RTTuple(-tuple.x, -tuple.y, -tuple.z, -tuple.w)
  }

  static func *(lhs: RTTuple, rhs: Double) -> RTTuple {
    RTTuple(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
  }

  static func /(lhs: RTTuple, rhs: Double) -> RTTuple {
    RTTuple(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
  }
}

