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
  
  /*** Leap Motion Control ***/
  if ( leap.getHands().size() > 0 )
  {
    Hand firstHand = leap.getHands().get(0);
    firstHand.draw();
    globe.rotateHorizontally(firstHand.getPosition().x * 360 / width);
    globe.rotateVertically(firstHand.getPosition().y * 360 / height);
  }
}

