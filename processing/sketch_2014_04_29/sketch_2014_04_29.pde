void setup() {

  // 16:9 format
  // size(3200, 1800);
  size(1280, 720);

  // square format
  // size(3000, 3000);
  //size(500, 500);

  smooth(8);

  background(0, 0, 0);

  //stroke(255, 255/2);
  strokeWeight(1);
  strokeCap(SQUARE);

  // 4 bits in x,y
  int numberDivX = 16;
  int numberDivY = 16;
  
  // 16 bits of resolution color
  int resolutionColor = 16;
  
  // 32 bits of resolution angle
  int resolutionAngle = 4;

  float sizeDivX = width / numberDivX;
  float sizeDivY = height / numberDivY;

  float noisePercentage = 1.0;

  for (int j = 0; j < numberDivY; j++) {
    for (int i = 0; i < numberDivX; i++) {
      
      noStroke();
      fill(int(random(resolutionColor))*(255/resolutionColor));
      
      float posX = sizeDivX/2 + i * sizeDivX + (randomDirection() * noisePercentage * random(width/100));
      float posY = sizeDivY/2 + j * sizeDivY + (randomDirection() * noisePercentage * random(width/100));
      
      push();
      
      translate(posX, posY);
      
      rotate(randomDirection() * int(random(resolutionAngle) * TWO_PI / resolutionAngle));
      
      rect(0, 0, sizeDivX, sizeDivY);
      
      pop();
    }
  }
}

void draw() {
}

void mousePressed() {
  saveFrame("image.png");
}

float randomDirection() {
  return (int(random(2))*2-1);
}
