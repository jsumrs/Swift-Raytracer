struct Projectile {
    let position: Point 
    let velocity: Vec3

    init(at position: Point, with velocity: Vec3) {
        self.position = Point(position.x, position.y, position.z)
        self.velocity = Vec3(velocity.x, velocity.y, velocity.z)
    }
}

struct Environment {
    let gravity: Vec3
    let wind: Vec3

    init(gravity: Vec3, wind: Vec3) {
        self.gravity = Vec3(gravity.x, gravity.y, gravity.z)
        self.wind = Vec3(wind.x, wind.y, wind.z)
    }
}

func tick(_ env: Environment, _ proj: Projectile) -> Projectile {
    let position = proj.position + proj.velocity
    let velocity = proj.velocity + env.gravity + env.wind 
    return Projectile(at: position, with: velocity)
}

@main
struct RayTracer {

    func runProjectileSim() {
        var c = Canvas(width: 900, height: 550)
        for run in 1...5 {
            var p = Projectile(at: Point(0, 1, 0), with: Vec3(1, 1.8, 0).normalized() * Double.random(in: 8.0...14.0))
            let e = Environment(gravity: Vec3(0, -0.1, 0), wind: Vec3(Double.random(in: -0.2...0.2), 0, 0))
            while p.position.y > 0 {
                let x = Int(p.position.x)
                let y = c.height - Int(p.position.y)

                if c.isInBounds(x: x, y: y) {
                    c[x, y] = Color(r: Double(run) / 10, g: Double(run * 2) / 10, b: Double(run * 3) / 10)
                }

                p = tick(e, p)
            }
        }
        c.saveToDisk()
    }

    static func main() {
        let a = Matrix(with: [
            [-5, 2, 6, -8],
            [1, -5, 1, 8],
            [7, 7, -6, -7],
            [1, -3, 7, 4],
        ])

        print(Matrix.identity4x4 * Vec3(4,4,4))

        let b = Matrix(with: [
            [2, 0, 0, 0],
            [0, 1, 0, 0],
            [0, 0, 1, 0],
            [0, 0, 0, 1],
        ])

        print(b * Vec3(4, 4, 4))
    }
}
