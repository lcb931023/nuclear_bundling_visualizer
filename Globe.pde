class Globe
{
  String[] map;
  float rotateHor = .0;
  float rotateVer = .0;
  float speed = 1;
  int radius = 80;
  boolean flicker = true;
  float flickerNoiseX = 0.0;
  float leapZoom = 300;

  public Globe()
  {
    construct();
  }

  private void construct()
  {
    map = loadStrings("map.txt");
  }

  // Gets called each draw();
  public void update()
  {
    translate(width/2, height/2, leapZoom);
    // Update Rotation
    //rotateHor+=speed;
    // Horizontal rotation
    rotateY(radians(rotateHor));
    // Vertically the sphere had to be flipped.
    rotateX(radians(180));
    rotateX(radians(rotateVer));

    // Draw the globe
    this.render();
    // Locate geodata on the globe
    // NEW YORK
    this.placeGeoData(41, -74);
    // WASHINGTON
    this.placeGeoData(38, -77);
    // BEIJING
    this.placeGeoData(39, 116);
    // SHANGHAI
    this.placeGeoData(31, 121);
    // PARIS
    this.placeGeoData(48, 2);
    // MOSCOW
    this.placeGeoData(55, 37);
    // LONDON
    this.placeGeoData(51, 0);
    // NEW DEIHI
    this.placeGeoData(28, 77);
    // PYONGYANG
    this.placeGeoData(39, 125);
    // ISLAMABAD
    this.placeGeoData(33, 73);
  }

  private void render()
  {
    float alpha = 200;
    if (flicker)
    {
      float noiseScale = 0.3;
      alpha = noise(flickerNoiseX * noiseScale) * 100 + 155;
      
      flickerNoiseX ++;
    }
    for (int lat = -90; lat < 90; lat++)
    {
      for (int lng = -180; lng < 180; lng++)
      {
        float c = Float.parseFloat(map[(lat + 90) * 360 + (lng + 180)]);
        if (c > 0)
        {
          float _lat = radians(lat);  
          float _lng = radians(lng);  
          float x = (radius + c * 0.02) * cos(_lat) * cos(_lng);
          float y = (radius + c * 0.02) * sin(_lat) * (-1);
          float z = (radius + c * 0.02) * cos(_lat) * sin(_lng);
          // The cyan of TRON is 111, 195, 223
          stroke(0, 56, 111, alpha);
          point(x, y, z);
        }
      }
    }
  }

  private void placeGeoData(float lat, float lng)
  {
    float _lat = radians(lat) * -1;
    float _lng = radians(lng);

    stroke(223, 116, 12);
    PVector v1 = toPointOnGlobe(lat, lng);

    float x2 = (radius + 10) * cos(_lat) * cos(_lng);
    float y2 = (radius + 10) * sin(_lat) * (-1);
    float z2 = (radius + 10) * cos(_lat) * sin(_lng);

    line(v1.x, v1.y, v1.z, x2, y2, z2);

    // #MAGICAL 3D ROTATION
    // 1. Since all discs are drawn on x and y only, suppose a vector is pointing out normal to the disc (the x and y plane)
    PVector discNormal = new PVector(0, 0, 1);
    // 2. Because rotate() rotates an angle around an axis (could be a vector),
    //    We need to rotate the disc on the plane the disc and a [line that points from middle of sphere to the point on globe] forms
    PVector line = toPointOnGlobe(lat, lng);
    line.normalize();
    //    (cont. 2) and to do that, we get the vector normal to such plane using cross()
    PVector axis = line.cross(discNormal);
    // 3. find the angle that needs to be rotated
    float ang = PVector.angleBetween(line, discNormal);

    // Draw Circle
    pushMatrix();
    translate(v1.x, v1.y, v1.z);
    rotate(-ang, axis.x, axis.y, axis.z);
    noFill();
    ellipse(0, 0, 5, 5);
    ellipse(0, 0, 8, 8);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }

  // Get the PVector location of a point on the globe
  private PVector toPointOnGlobe(float lat, float lng)
  {
    float _lat = radians(lat) * -1;
    float _lng = radians(lng);

    float x = radius * cos(_lat) * cos(_lng);
    float y = radius * sin(_lat) * (-1);
    float z = radius * cos(_lat) * sin(_lng);

    return new PVector(x, y, z);
  }

  // [TODO]
  private void drawCurveOnSphere(float lat1, float lng1, float lat2, float lng2)
  {
  }

  public void rotateHorizontally( float degree )
  {
    rotateHor = degree;
  }
  public void rotateVertically( float degree )
  {
    rotateVer = degree;
  }

  public void zoom( float z )
  {
    leapZoom = z;
  }
}

