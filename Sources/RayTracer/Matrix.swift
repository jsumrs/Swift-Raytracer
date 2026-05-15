struct Matrix {
  let data: [[Double]]

  init (with data: [[Double]]) {
    self.data = data
  }

  subscript(row: Int, col: Int) -> Double {
    get { data[row][col] }
  }

  static func ==(lhs: Matrix, rhs: Matrix) -> Bool {
    lhs.data.count == rhs.data.count &&
    zip(lhs.data, rhs.data).allSatisfy({$0.elementsEqual($1, by: { Double.nearEqual($0, $1)})})
  }

  static func !=(lhs: Matrix, rhs: Matrix) -> Bool {
    !(lhs == rhs)
  }

}