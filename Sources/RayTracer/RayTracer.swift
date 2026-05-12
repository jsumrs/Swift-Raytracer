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
        var c = Canvas(width: 900, height: 550)
        var p = Projectile(at: Point(0, 1, 0), with: Vec3(1, 1.8, 0).normalized() * 11.5)
        let e = Environment(gravity: Vec3(0, -0.1, 0), wind: Vec3(-0.01, 0, 0))
        

        while p.position.y > 0 {
            let x = Int(p.position.x)
            let y = c.height - Int(p.position.y)
            
            if c.isInBounds(x: x, y: y){
                c[x, y] = Color(r: 0.9, g: 0.0, b: 0.0)
            }
            
            p = tick(e, p)
        }
        c.saveToDisk()

    }
}
