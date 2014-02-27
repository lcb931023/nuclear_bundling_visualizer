class RotatingAtom
{
  PVector sphereCenter;
  float pulseNoiseX = 0.0;
  float roll = 0.0;
  float pitch = 0.0;
  float yaw = 0.0;
  float radius;
  float rSpeed;
  public RotatingAtom(PVector pCenter, PVector initRotation, float pRadius, float speed)
  {
    sphereCenter = pCenter;
    roll = initRotation.x;
    pitch = initRotation.y;
    yaw = initRotation.z;
    rSpeed = speed;
    radius = pRadius;
  }
  
  // Gets called each draw();
  public void update()
  {
    translate(sphereCenter.x, sphereCenter.y, sphereCenter.z);
    /* Draw the atom */
    // Appearance
    noFill();
    stroke(111, 195, 223, 100);
    // rotation
    roll += rSpeed;
    pitch += rSpeed;
    yaw += rSpeed;
    rotateX(radians(roll));
    rotateY(radians(pitch));
    rotateZ(radians(yaw));
    beginShape();
    float angle = 0.0;
    int vAmount = 40;
    for (int i = 0; i < vAmount; i ++)
    {
      angle += 360/vAmount;
      vertex( radius * cos(radians(angle)), radius * sin(radians(angle)), 0 );
    }
    endShape(CLOSE);
  }
  
  
  
  
}
