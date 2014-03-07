class PulsingSphere
{
  PVector sphereCenter;
  float radius = 10;
  float pulseNoiseX = 0.0;
  // [SuddenThought] Latios should pair up with Longios
  int latAmount = 6;
  int lngAmount = 8;
  float pitch = 0.0;
  float roll = 0.0;
  float yaw = 0.0;
  public PulsingSphere(PVector pCenter)
  {
    sphereCenter = pCenter;
  }

  // Gets called each draw();
  public void update()
  {
    translate(sphereCenter.x, sphereCenter.y, sphereCenter.z);
    /* Draw the sphere */
    // Appearance
    noFill();
    stroke(111, 195, 223, 100);
    // Spin it
    roll = random(360);
    pitch = random(360);
    yaw = random(360);
    rotateX(radians(roll));
    rotateY(radians(pitch));
    rotateZ(radians(yaw));
    // Jerk it
    sphereDetail(latAmount + int(random(-3, 3)), lngAmount + int(random(-4, 4)));
    // Pulse it
    pulseNoiseX += 0.31;
    sphere( 5 + radius * noise(pulseNoiseX) );
  }
}

