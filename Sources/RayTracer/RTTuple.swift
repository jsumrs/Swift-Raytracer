import Foundation

enum RTTupleType {
  case point, vector
}

struct RTTuple {
  let x: Float
  let y: Float
  let z: Float
  let w: Float
  let type: RTTupleType // For the sake of following the book, we store type info here...
  
  
  init(_ x: Float, _ y: Float, _ z: Float, _ w: Float) {
    self.x = x
    self.y = y
    self.z = z
    self.w = w
    self.type = w == 1.0 ? .point : .vector // ew i hate this, remove later and refactor points and vectors out...
  }
  
  static func point(_ x: Float, _ y: Float, _ z: Float) -> RTTuple {
    return RTTuple(x, y, z, 1.0)
  }

  static func vector(_ x: Float, _ y: Float, _ z: Float) -> RTTuple {
    return RTTuple(x, y, z, 0.0)
  }
  
  static func ==(lhs: RTTuple, rhs: RTTuple) -> Bool {
    return lhs.x == rhs.x &&
           lhs.y == rhs.y &&
           lhs.z == rhs.z &&
           lhs.w == rhs.w
  }
  
  static func +(lhs: RTTuple, rhs: RTTuple) -> RTTuple {
    return RTTuple(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w)
  }

  static func -(lhs: RTTuple, rhs: RTTuple) -> RTTuple {
    return RTTuple(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z, lhs.w - rhs.w)
  }

  static prefix func -(tuple: RTTuple) -> RTTuple {
    return RTTuple(-tuple.x, -tuple.y, -tuple.z, -tuple.w)
  }

  static func *(lhs: RTTuple, rhs: Float) -> RTTuple {
    return RTTuple(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs, lhs.w * rhs)
  }

  static func /(lhs: RTTuple, rhs: Float) -> RTTuple {
    return RTTuple(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs, lhs.w / rhs)
  }
}

