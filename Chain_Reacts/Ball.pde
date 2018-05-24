/* ChickenNuggets (Maggie Zhao, Bing Li, Kenny Li)
APCS2 pd1
Hw#53 - All That Bouncin'
2018-05-24 R */

class Ball {
  
  //instance (global) variables 
  float dX, dY, xPos, yPos;
  color c;
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  final float CHANGE_FACTOR = .25;
  final float MAX_RADIUS = 50;
  int state;
  
  //default constructor
  Ball() {
    c = color(random(256),random(256),random(256)); //set to random color
    //a ball must know where it's going AND how fast it's going --> velocity
    dX = random(5) * cos(random(TWO_PI)); //velocity in the x-direction
    dY = random(5) * sin(random(TWO_PI)); //velocity in the y-direction
    //the birth place of all our balls
    xPos = 300;
    yPos = 300;
    state = 0;
  }
  
  Ball(int newState, float newXPos, float newYPos) {
    this();
    state = newState;
    xPos = newXPos;
    yPos = newYPos;
  }
  
  //Fill each Ball with a random color
  //Give them their shape --> elipse
  //Every Ball has a constant velocity different from each other
  //Xpos and Ypos of the Ball are updated as it moves
  //If the Ball reaches the boundary, bounces off the boundary by changing its dirn
  void move() {
    fill(c);
    ellipse(xPos,yPos,10,10);
    xPos += dX;
    yPos += dY;
    if ((yPos <= 0) || (yPos >= 600)) {
      dY *= -1;
    }
    if ((xPos <= 0) || (xPos >= 600)) {
      dX *= -1;
    }
  }
    
  void grow() {
  }
  
  void shrink() {
  }
  

}