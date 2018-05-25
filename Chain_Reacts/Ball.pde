/* ChickenNuggets (Maggie Zhao, Bing Li, Kenny Li)
APCS2 pd1
Hw#53 - All That Bouncin'
2018-05-24 R */

class Ball {
  
  //instance (global) variables 
  float dX, dY, xPos, yPos, r;
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
    state = MOVING;
    r = 10;
  }
  
  //constructor for mousePressed balls
  Ball(int newState, float mouseXPos, float mouseYPos) {
    this();
    state = newState;
    xPos = mouseXPos;
    yPos = mouseYPos;
  }
  
  //Fill each Ball with a random color
  //Give them their shape --> elipse
  //Every Ball has a constant velocity different from each other
  //Xpos and Ypos of the Ball are updated as it moves
  //If the Ball reaches the boundary, bounces off the boundary by changing its dirn
  void move() {
    if ((yPos <= 0) || (yPos >= 600)) {
      dY *= -1;
    }
    if ((xPos <= 0) || (xPos >= 600)) {
      dX *= -1;
    }
    xPos += dX;
    yPos += dY;
    fill(c);
    ellipse(xPos,yPos,r,r);    
  }
  
  //compares ball with rest of balls in list
  //if a growing ball is overlapping with a moving ball, moving ball starts growing
  void check(Ball[] ballList) {
    for (int x = 0; x < ballList.length; x++) {
      float xDiff = ballList[x].xPos - xPos;
      float yDiff = ballList[x].yPos - yPos;
      float sumR = ballList[x].r + r;
      if ((pow(xDiff, 2) + pow(yDiff, 2) <= pow(sumR, 2)) && 
         (state == MOVING) &&
         ((ballList[x].state == GROWING) || (ballList[x].state == SHRINKING))){
         state = GROWING;
      }
    }
  }
  
  //grows until it reaches threshold radius, starts shrinking afterwards
  void grow() {
    if (r >= MAX_RADIUS)
      state = SHRINKING;
    r += CHANGE_FACTOR;      
    fill(c);
    ellipse(xPos,yPos,r,r);
  }
  
  //shrinks until it reaches radius of 0, turns dead afterwards
  void shrink() {
    if (r <= 0)
      state = DEAD;
    r -= CHANGE_FACTOR;      
    fill(c);
    ellipse(xPos,yPos,r,r);      
  }
  
  //determines the ball's action based on state
  void update(Ball[] ballList) {
    if (state == MOVING) {
      move();
      check(ballList);      
    } else if (state == GROWING) {
      grow();
    } else if (state == SHRINKING) {
      shrink();
    }
  }
  

}
