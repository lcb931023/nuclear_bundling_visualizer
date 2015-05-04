// TODO: Fix leap control
import de.voidplus.leapmotion.*;
LeapMotion leap;
Grid grid;
Globe globe;
PulsingSphere pulsingSphere;
RotatingAtom rotatingAtom1;
RotatingAtom rotatingAtom2;
RotatingAtom rotatingAtom3;
PVector globeCenter;

boolean useMouse = false;
boolean sketchFullScreen() {
  return true;
}
void setup()
{
  size(displayWidth, displayHeight, P3D);
  frameRate(60);
  smooth();
  //leap = new LeapMotion(this);
  /*** Create Globe ***/
  globe = new Globe();
  globeCenter = new PVector(width/2, height/2, 300);
  /*** Other things to be created ***/
//  grid = new Grid();
  pulsingSphere = new PulsingSphere(globeCenter);
  rotatingAtom1 = new RotatingAtom(globeCenter, new PVector(40, 70, 130), 30, 5);
  rotatingAtom2 = new RotatingAtom(globeCenter, new PVector(70, 130, 40), 35, 6);
  rotatingAtom3 = new RotatingAtom(globeCenter, new PVector(130, 40, 70), 25, 8);
  strokeWeight(1);
  leap = new LeapMotion(this);
}

void draw()
{
  background(255);
  pushMatrix();
  /*** Update background grid ***/
//  grid.update();
  popMatrix();
  pushMatrix();
  /*** Update Globe ***/
  globe.update();
  popMatrix();
  pushMatrix();
  /*** Update other  ***/
  pulsingSphere.update();
  popMatrix();
  pushMatrix();
  rotatingAtom1.update();
  popMatrix();
  pushMatrix();
  rotatingAtom2.update();
  popMatrix();
  pushMatrix();
  rotatingAtom3.update();
  popMatrix();
  pushMatrix();
  /*** Leap Motion Control ***/
  useMouse = true;

  if ( !leap.isConnected() )
  { 
    useMouse = true;
  }
  else {
    useMouse = false;
  }
  if ( !useMouse )
  {
    if ( leap.countHands() > 0 )
    {
      Hand firstHand = leap.getHands().get(0);
      stroke(0, 56, 111);
      firstHand.drawSphere();
      globe.rotateHorizontally(firstHand.getPosition().x * 360 / width);
      globe.rotateVertically(firstHand.getPosition().y * 360 / height);
      globe.zoom( firstHand.getPosition().z * 3 + 400 );
    }
  }

  popMatrix();
}

void mouseMoved()
{
  if (useMouse)
  {
    globe.rotateHorizontally(mouseX * 360 / width);
    globe.rotateVertically(mouseY * 360 / height);
  }
}

