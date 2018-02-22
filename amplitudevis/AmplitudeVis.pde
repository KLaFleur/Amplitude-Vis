/* 
look into &&
coloring

*/
 import processing.sound.*;
float rad = 0;        
float xpos, ypos;     

float xspeed = 5.0;  
float yspeed = 2.8;  

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
boolean impact = false;
boolean smaller = false;
boolean bigger = false;

boolean leftWall = false;
boolean rightWall = false;
boolean topWall = false;
boolean bottomWall = false;
Amplitude amp;
AudioIn in;
int rainbowMode;
void setup() 
{
    
  // Load a soundfile from the /data folder of the sketch and play it back
 // file = new SoundFile(this, "kurt.mp3");
  //file.play();
  
    amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  

  size(1400, 849);
  noStroke();
  frameRate(400);
  ellipseMode(RADIUS);

  xpos = width/2;
  ypos = rad - .1;
}
//drawBackround(0):
void draw() 
{
//fill (random(0,200) );
 if ( rad == 8){
    bigger = true;
    smaller = false;
   //fill (random(0,200) );
  }
if (rad == 15) {
  smaller= true;
  bigger = false;
  //fill ( random(150, 255), (0), (0));
} 
//if (xpos < 350) && (float)(ypos < 150) {
  
//}
if (bigger == true) {
  rad++;
}  else if (smaller == true){
  rad--;
}
if (xpos > width-rad){
    leftWall = false;
    topWall = false;
    bottomWall = false;
    rightWall = true;
  } else if(xpos < rad){
      leftWall = true;
    topWall = false;
    bottomWall = false;
    rightWall = false;
  } else if (ypos > height-rad){
   leftWall = false;
    topWall = false;
    bottomWall = true;
    rightWall = false;
} else if (ypos < rad){
   leftWall = false;
    topWall = true;
    bottomWall = false;
    rightWall = false;
}
  if (rightWall == true){
     fill (random (0,255),random(0,255),random(0,255));
  } else if (leftWall == true) {
    fill (0,0, random(0,255));
 } else if (bottomWall == true){
   fill(random(0,255), 0 , 0 );
 } else if (topWall == true){
   fill(0, random(0,255), 0);
 }
/*if (impact == true) {
     fill (random (0,255), random(0,255), random(0,255));
    //impact = false;
  } */
  //background(102);
  
  
  rad = amp.analyze() * 900;
  

  
 
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  

  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
    impact = true;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
   impact =true;
  }
  
  
  ellipse(xpos, ypos, rad, rad);
  
}