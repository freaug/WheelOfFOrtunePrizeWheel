int r;
int numPoints;
int index;
float angle;
float dr, c;
boolean stopped = true;
float drVal;

StringList randomNames;
StringList scrambled;

String[] names;

void setup() {
  fullScreen();
  //size(900, 850);
  background(0);
  
  String[] names = loadStrings("names.txt");

  randomNames = new StringList();
  scrambled = new StringList();

  r = names.length;
  numPoints = names.length;
  angle =TWO_PI/(float)numPoints;
  c = angle;
  index = int(random(names.length));
  textSize(18);
  drVal = random(0.995, 0.997);
  smooth();

  for (int i = 0; i < numPoints; i++) {
    randomNames.append(names[i]);
    println(randomNames.get(i));
  }
  randomNames.shuffle();
}

void draw() {
  background(0);

  translate(width/2, height/2);

  dr *= drVal;

  if ( !stopped && dr < 0.001) {
    stopped = true;
    dr = 0;
  }
  angle += dr;
  angle%=TWO_PI;
  for (int i=0; i<numPoints; i++)
  {
    pushMatrix();
    //name allignment
    rotate(-angle + i*TWO_PI/numPoints);  
    fill(255);
    text(randomNames.get(i), 150, -numPoints*0.25);
    //arc's go here
    noFill();
    strokeWeight(1);
    stroke(255);
    arc(0, 0, 800, 800, 0, c, PIE);
    rotate(c);
    popMatrix();
  }
  //center and arrow
  stroke(0);
  fill(0, 255, 0);
  triangle(350, 0, 430, -20, 430, 20);
  fill(0);
  stroke(255);
  ellipse(0, 0, 100, 100);
}

//spin 
void mousePressed() {
  if (dr == 0) {
    dr = random(1);
    stopped = false;
  }
}
