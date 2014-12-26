class Apple {
  color red=color(random(230, 250), 0, 0);

  final int GROUND=40;
  int x, y;
  int speed=int(random(4, 5));
  int step=-1;
  int start=0;
  int bounce=0;
  int fallTime;
  int stem=-150;
  int dir=1;
  boolean rock=true;


  //========================== 
  Apple(int nx, int ny) {
    x=nx;
    y=ny;
    start=nx;
    noStroke();
    fill(250, 0, 0);
    ellipse(x, y, 15, 15);
    fallTime=int(random(240));
    if (random(10)>5) {
      dir=-1;
    }
    //stem*=dir;
  }

  //===========================
  void draw() {

    if (step<0) {
      //Wait before falling
      fallTime--;
      if (fallTime<0) {
        step++;
      }
    }
    else if (step==0) {
      //Fall down
      if (y<height-GROUND) {
        //      ellipse(x, y, 20, 20);
        if (y%3==1) {
          speed+=1;
          //Speed up
        }
        y+=speed;
        x+=2*dir;
        //start+=1*dir;
        //stem=int(-150);
      } 
      else {
        step+=1;
        start=x;
        rock=true;
//        dir*=0.5;
        //y-=speed;
      }
    }
    else if (step==1) {
      //Bounce
      y=int(0.04*((x-start)*(x-start)-(100-20*bounce)*dir*(x-start))+height-GROUND);
      //    ellipse(x, y, 20, 20);
      x+=2*dir;
      stem+=10*dir;
      if (y>height-GROUND) {
        start+=(100-20*bounce)*dir;
        bounce++;
        x-=2*dir;
        rock=true;
        if (bounce>=5) {
          step++;
        }
      }
    }
    else if (step==2) {
      //Roll to edge of screen
      if (abs(x-width/2)<random(100, 300)) {
        x+=2*dir;
        stem+=5*dir;
      }
      else {
        step++;
      }
    }
    //      ellipse(100, height-40, 80, 50);
    if (sq (x-100)/sq(80)+sq(y-height+40)/sq(50)<1) {
      //      if (x<100){
      //        dir=-1;
      //      }else {
      //        dir=2;
      //      }
      if (rock==true) {
        dir*=-1;
//        if (step==0){
//        dir*=2;
//        }
      }

      if (step==0) {
        x+=2*dir;
        while (sq (x-100)/sq(80)+sq(y-height+40)/sq(50)<1) {
          y-=1;
        }
        stem+=10*dir;
        speed=2;
        
      } 
      else if (step==1 && rock==true) {
        start-=(100-20*bounce)*dir;

        x+=2*dir;
      } 
      //x+=2*dir;
      rock=false;
    }

    //Draw
    stroke(0);
    translate(x, y);
    rotate(stem*PI/180);
    line(0, 0, 10, 10);
    rotate(-stem*PI/180);
    translate(-x, -y);
    noStroke();
    fill(red);

    ellipse(x, y, 20, 20);
  }
}  

