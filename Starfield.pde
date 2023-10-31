StormCloud[] c = new StormCloud[10];
Particle[] p = new Particle[500];
void setup(){
 size(800,800);
  for(int i=0; i<c.length; i++){
  c[i]= new StormCloud();
  }
  noStroke();
  for(int i=0; i<480; i++)
  p[i]= new Particle();
  for(int i=480; i<p.length; i++)
  p[i]= new BigParticle();
}
void draw(){
 background(#ADD8E6);
 fill(0);
   rect(375,450,50,700);
   fill(#B4AFAF);
  ellipse(550,250,300,300); 
  ellipse(250,250,300,300); 
  noFill();
  fill(#FFC0CB);
  ellipse(550,250,200,200);
  ellipse(250,250,200,200);  
  noFill();
  fill(#B4AFAF);
  ellipse(400,300,410,410);
  stroke(3);
  pushMatrix();
  translate(400, 450);
  rotate(frameCount / 10.0);
  ellipse(0,0,120,270);
  popMatrix();
  fill(255,255,255);
  ellipse(270,290,130,130); 
  ellipse(530,290,130,130);
  fill(0,0,0);
  ellipse(270,290,50,50); 
  ellipse(530,290,50,50);
  for(int i=0;i<c.length;i++){
  c[i].showc();
  }
  for(int i=0;i<p.length;i++){
  p[i].show();
  p[i].explode();
  }
}

class Particle{
  float myX,myY, mysize;
  double myspeed, mycolor, myangle;
  Particle(){
    myX=myY=400;
    mysize=5;
    myspeed=Math.random()*5+5;
    mycolor=color(0,0,(int)(Math.random()*155)+100);
    myangle=Math.random()*2*Math.PI;
  }
  void show(){
    fill((int)mycolor);
    ellipse(myX,myY,mysize,mysize);
  }
  void explode(){
    myX=myX+cos((float)myangle)*(float)myspeed;
    myY=myY+sin((float)myangle)*(float)myspeed;
    if (myY>800||myY<0){
    myX=400;
    myY=400;
    myangle=Math.random()*2*Math.PI;
    }
  }
}

class BigParticle extends Particle{
  BigParticle() {
    myX=myY=400;
    myspeed=Math.random()*5+3;
    mycolor=color(0,0,(int)(Math.random()*155)+100);
    myangle=Math.random()*2*Math.PI;
    mysize=30;
  }
}

class StormCloud{
   int myX,myY,mywidth,myheight, mycolor, myopacity;
  StormCloud() {
    myX= (int)(Math.random()*50)+350;
    myY= (int)(Math.random()*30)+50;
    mywidth=(int)(Math.random()*80)+160;
    myheight=(int)(Math.random()*40)+40;
    mycolor=(int)(Math.random()*10)+30;
    myopacity=(int)(Math.random()*60);
  }
    void showc(){
   fill(mycolor,myopacity);
   ellipse(myX,myY,mywidth,myheight);
  }
}

