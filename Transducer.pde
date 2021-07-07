class Transducer {
    float pos = 0;
    private float vel = 0;
    private float strength;
    private float springStrength;
    private float friction;

    public Transducer(float strength, float springStrength, float friction) {
        this.strength = strength;
        this.springStrength = springStrength;
        this.friction = friction;
    }

    public void tick() {
        // spring
        vel -= pos * springStrength;
        
        // friction
        vel *= friction;
        // velocity
        pos += vel;
    }

    public void applyForce(float force) {
        vel += force * strength;
    }
}
