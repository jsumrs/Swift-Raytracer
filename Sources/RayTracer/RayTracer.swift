struct Projectile {
    let position: RTTuple
    let velocity: RTTuple

    init(at position: RTTuple, with velocity: RTTuple) {
        self.position = RTTuple.point(position.x, position.y, position.z)
        self.velocity = RTTuple.vector(velocity.x, velocity.y, velocity.z)
    }
}

struct Environment {
    let gravity: RTTuple
    let wind: RTTuple 

    init(gravity: RTTuple, wind: RTTuple) {
        self.gravity = RTTuple.vector(gravity.x, gravity.y, gravity.z)
        self.wind = RTTuple.vector(wind.x, wind.y, wind.z)
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
        var p = Projectile(at: RTTuple.point(0, 1, 0), with: RTTuple.vector(1, 1, 0).normalized())
        let e = Environment(gravity: RTTuple.vector(0, -0.1, 0), wind: RTTuple.vector(-0.01, -0.01, 0))

        while p.position.y > 0 {
            print("Position: \(p.position.x), \(p.position.y), \(p.position.z)")
            p = tick(e, p)
        }
        print("P has stabilized")

    }
}
