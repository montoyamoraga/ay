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

  // 8 bits
  int numberDivisions = 256;
  int numberTurns = 4;

  float angle = TWO_PI / (numberDivisions);

  float noisePercentage = 1.0;

  for (int j = 0; j < numberTurns; j++) {
    for (int i = 0; i < numberDivisions; i++) {

      float startNoiseX = randomDirection() * noisePercentage * width/100;
      float startX = width/2 + startNoiseX;

      float startNoiseY = randomDirection() * noisePercentage * height/100;
      float startY = height/2 + startNoiseY;

      float radius = random(0, height/2);

      float endX = startX + radius * cos(i * angle + randomDirection() * random(noisePercentage * TWO_PI/100));

      float endY = startY + radius * sin(i * angle + randomDirection() * random(noisePercentage * TWO_PI/100));

      stroke(255, random(255));

      line(startX, startY, endX, endY);
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
