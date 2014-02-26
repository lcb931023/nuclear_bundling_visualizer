class Globe
{
  String[] map;
  float rotateHor = .0;
  float rotateVer = .0;
  float speed = 1;
  int radius = 50;
  
  boolean flicker = true;
  float flickerNoiseX = 0.0;
  
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
    translate(width/2, height/2, 300);
    // Update Rotation
    //rotateHor+=speed;
    // Horizontal rotation
    rotateY(radians(rotateHor));
    // Vertically the sphere had to be flipped.
    rotateX(radians(180));
    rotateX(radians(rotateVer));
    
    // Draw the globe
    this.render();
    // Placing geodata on the globe
    // e.g. New York 41°N,74°W
    this.placeGeoData(41, -74);
    
  }
  
  private void render()
  {
    float alpha = 200;
    if (flicker)
    {
      float noiseScale = 0.3;
      alpha = noise(flickerNoiseX * noiseScale) * 200 + 55;
      flickerNoiseX ++;
    }
    for(int lat = -90; lat < 90; lat++)
    {
      for(int lng = -180; lng < 180; lng++)
      {
        float c = Float.parseFloat(map[(lat + 90) * 360 + (lng + 180)]);
        if(c > 0)
        {
          float _lat = radians(lat);  
          float _lng = radians(lng);  
          float x = (radius + c * 0.02) * cos(_lat) * cos(_lng);
          float y = (radius + c * 0.02) * sin(_lat) * (-1);
          float z = (radius + c * 0.02) * cos(_lat) * sin(_lng);
          // The cyan of TRON is 111, 195, 223
          stroke(111, 195, 223, alpha);
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
    float x1 = radius * cos(_lat) * cos(_lng);
    float y1 = radius * sin(_lat) * (-1);
    float z1 = radius * cos(_lat) * sin(_lng);
    
    float x2 = (radius + 20) * cos(_lat) * cos(_lng);
    float y2 = (radius + 20) * sin(_lat) * (-1);
    float z2 = (radius + 20) * cos(_lat) * sin(_lng);
    
    line(x1, y1, z1, x2, y2, z2);
    
  }
  
  public void rotateHorizontally( float degree )
  {
    rotateHor = degree;
  }
  public void rotateVertically( float degree )
  {
    rotateVer = degree;
  }
  
}
