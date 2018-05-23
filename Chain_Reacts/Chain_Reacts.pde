/* ChickenNuggets (Maggie Zhao, Bing Li, Kenny Li)
APCS2 pd1
Hw#53 - All That Bouncin'
2018-05-24 R */


//Create an array lists of 25 balls
Ball[] ballList = new Ball[25];

//Run once upon start of the program:
//   - background color is set to black
//   - size of the screen is set to 600 x 600
//   - instantiate the Ball object ballList
void setup() {
  background(0);
  size(600, 600);
  for (int x = 0; x < 25; x++) {
    ballList[x] = new Ball();
  }
}

// Runs continously after setup() is called 
// Resets background (which covers old circles)
// for every Ball in ballList, call the move method
void draw() {
  background(0);
  for (int x = 0; x < 25; x++) {
    ballList[x].move();
  }
}
