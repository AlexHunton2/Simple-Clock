int margin = 30;
int fillWidth = 15;
int offset = 10;
float angle = 0;
int speed = 0;

float startMSec = millis();

void setup() {
  size(400, 500);
  frameRate(60);
}

void draw() {
  background(0);
  float msecPassed = millis() - startMSec;
  
  if (speed != 0)
    angle = map(msecPassed, 0, speed*1000, 0, 360);
  ellipseMode(CENTER);
  fill(255);
  ellipse(width/2, width/2, width-(margin*2), width-(margin*2));
  fill(0);
  int insideW = width-(margin*2)-fillWidth;
  ellipse(width/2, width/2, insideW, insideW);
  float relativex = (cos(radians((angle-90))));
  float relativey = (sin(radians(-(angle+90))));
  float globalx = map(relativex, -1, 1, margin+offset, width-margin-offset);
  float globaly = map(relativey, -1, 1, margin+offset, width-margin-offset);
 
  stroke(255);
  strokeWeight(fillWidth/2);
  strokeCap(ROUND);
  line(width/2, width/2, globalx, globaly);
  strokeWeight(1);
  
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("+", width/2-50, 450);
  text(speed, width/2, 450);
  text("-", width/2+50, 450);

}

void mouseClicked() {
  int space = 16;
  if ((width/2-50)-space <= mouseX && mouseX < (width/2-50)+space) {
      if (450-space <= mouseY && mouseY < 450+space) {
        speed++; 
        startMSec = millis();
      }
  }
  
  if ((width/2+50)-space <= mouseX && mouseX < (width/2+50)+space) {
      if (450-space <= mouseY && mouseY < 450+space) {  
        if (speed != 0)
          speed--; 
          startMSec = millis();
      }
  }
}
