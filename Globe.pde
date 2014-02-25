class Globe
{
  String[] map;
  float rotateHor = .0;
  float rotateVer = .0;
  float speed = 1;
  int radius = 50;
  
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
    rotateHor+=speed;
    // Horizontal rotation
    rotateY(radians(rotateHor));
    // Vertically the sphere had to be flipped.
    rotateX(radians(180));
    rotateX(radians(rotateVer));
    
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
          stroke(c + 100, 200);
  
          point(x, y, z);
        }
      }
    }
    
    // Placing geodata on the globe
    // e.g. New York 41°N,74°W
    float _lat = radians(41) * -1;
    float _lng = radians(-74);
    for(int i = 0; i < 10; i++)
    {
      float x = (radius + i * 2) * cos(_lat) * cos(_lng);
      float y = (radius + i * 2) * sin(_lat) * (-1);
      float z = (radius + i * 2) * cos(_lat) * sin(_lng);
      
      stroke(0,255,0);
      point(x, y, z);
    }
    
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
