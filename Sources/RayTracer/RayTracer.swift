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

    static func main() {
        var p = Projectile(at: Point(0, 1, 0), with: Vec3(1, 1, 0).normalized())
        let e = Environment(gravity: Vec3(0, -0.1, 0), wind: Vec3(-0.01, -0.01, 0))

        while p.position.y > 0 {
            print("Position: \(p.position.x), \(p.position.y), \(p.position.z)")
            p = tick(e, p)
        }
        print("P has stabilized")

    }
}
