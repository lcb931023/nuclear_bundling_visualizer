import de.voidplus.leapmotion.*;

LeapMotion leap;
Globe globe;

void setup()
{
  size(960, 560, P3D);
  frameRate(30); // I wonder what this does.
  smooth();
  leap = new LeapMotion(this);
  
  /*** Create Globe ***/
  globe = new Globe();
  /*** Other things to be created ***/
}

void draw()
{
  background(0);
  /*** Update Globe ***/
  globe.update();
}

void mouseMoved()
{
  globe.rotateHorizontally(float(mouseX * 360 / width));
  
  globe.rotateVertically(float(mouseY * 360 / height));
  //println(mouseX);
}
