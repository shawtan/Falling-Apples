color brown=color(50, 35, 15);
Apple[] apples=new Apple[10];
PImage tree;


void setup() {

  frameRate(16);
  size(640, 360);

  tree=createImage(width, height, RGB);
  smooth();
  pushMatrix();
  translate(width/2, height);

  stroke(brown);
  strokeWeight(40);
  line(0, 0, 0, -120);
  translate(0, -120);
  branch(120);
  noStroke();
  popMatrix();
  //Draw ground
  fill(50);  
  rect(0, height, width, -40);
  //Draw rock
  fill(180);
  for(int  i=0;i<width;i++){
    for (int j=0;j<height;j++){
      if (sq(i-100)/sq(60)+sq(j-height+40)/sq(40)<1){
        stroke(random(160,200));
//        System.out.println("true"+i+"y:"+j);
        line(i,j,i,j);
      }
    }
  }
  noStroke();
//  ellipse(100, height-40, 80, 50);

  saveFrame("tree.png");
  tree=loadImage("tree.png");
  image(tree, 0, 0);
  for (int i=0;i<apples.length;i++) {
    apples[i]=new Apple(int(random(100, 400)), int(random(20, 100)));
  }
}


void draw() {
  image(tree, 0, 0);

  for (int i=0;i<apples.length;i++) {
    apples[i].draw();
  }
}

void branch(float size) {
  size*=(0.70);

  if (size>9) {
    //First branch
    pushMatrix();   
    strokeWeight(size/3);
    stroke(brown);
    rotate(random(-.5, 1.5));
    line(0, 0, 0, -size);
    translate(0, -size);
    branch(size);
    popMatrix();

    //Second branch
    pushMatrix();
    rotate(-random(.5, -1.5));
    strokeWeight(size/3);
    stroke(brown);
    line(0, 0, 0, -size);
    translate(0, -size);
    branch(size);
    popMatrix();

    //Chance of leaves
    if (random(100)>60) {
      leaf(int(10-size/15));
    }
  } 
  else {
    //Draw leaves when the branches are too small
    leaf(0);
  }
}

void leaf(int n) {
  if (n<20) {
    //Draw circles of random green-ness
    pushMatrix();
    fill(0, random(180, 240), 0);
    stroke(color(0, random(150, 255), 0));
    ellipse(0, 0, 10, 10);
    translate(random(-8, 8), random(-8, 8));

    leaf(n+1);
    popMatrix();
  }
}

