/* ChickenNuggets (Maggie Zhao, Bing Li, Kenny Li)
APCS2 pd1
Hw#53 - All That Bouncin'
2018-05-24 R */

class Ball {
  
  //instance (global) variables 
  float speed, direction, x, y, xPos, yPos;
  color c;
  
  //default constructor
  Ball() {
    c = color(random(256),random(256),random(256)); //set to random color
    speed = random(10);   //set to random speed
    direction = radians(random(360));  //set a random angle 
    //a ball must know where it's going AND how fast it's going --> velocity
    x = speed * cos(direction); //velocity in the x-direction
    y = speed * sin(direction); //velocity in the y-direction
    //the birth place of all our balls
    xPos = 300;  
    yPos = 300;  
  }
  
  //Fill each Ball with a random color
  //Give them their shape --> elipse
  //Every Ball has a constant velocity different from each other
  //Xpos and Ypos of the Ball are updated as it moves
  //If the Ball reaches the boundary, bounces off the boundary by changing its dirn
  void move() {
    fill(c);
    ellipse(xPos,yPos,10,10);
    xPos += x;
    yPos += y;
    if ((yPos <= 0) || (yPos >= 600)) {
      direction *= -1;
      x = speed * cos(direction);
      y = speed * sin(direction);
    }
    if ((xPos <= 0) || (xPos >= 600)) {
      direction = PI - direction;
      x = speed * cos(direction);
      y = speed * sin(direction);
    }
  }
  }
