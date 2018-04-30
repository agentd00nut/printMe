import hpglgraphics.*;

HPGLGraphics hpgl;

void setup() {

  //size(400, 400, P2D);
  
  // HPGL (Roland DXY-1350A) coordinate ranges:
  // A4 : 11040 x 7721 (297 x 210 mm)
  // A3 : 16158 x 11040 (420 x 297 mm)
  
  size(1104, 772);
  
  hpgl = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  hpgl.setPaperSize("A4");
  hpgl.setPath("random_walk.hpgl");

}

void draw() {
  translate(width/2, height/2);
  background(255);
  stroke(0);
  noFill();

  beginRecord(hpgl);

  // continuous lines are best drawn with shapes/vertices. Otherwise the pen up/down
  // for each line segment causes weird effect (v0.1 of HPGLGraphics)
  float x, y, a, r;
  
  //x=width/2;
  //y=height/2;

  hpgl.setCurveDetail(5);
  int n=0;
  for(float b=0; b<TWO_PI; b+=PI/2){
    beginShape();
    a=b;
    println(a);
    for (r=40; r<200; r+=PI+PI/2) {
      x=cos(a)*r;
      y=sin(a)*r;
      if(n%2==0){
        a+=PI/9;
      }else{
        a-=PI/9;
      }
      //y = y + (int)random(-50,50);
      curveVertex(x, y);
      //rect(x,y,20,20);
    }
    endShape();
    //beginShape();
    //a=b;
    //for(r=1; r<40; r+=PI/2){
    //  x=cos(a)*r;
    //  y=sin(a)*r;
    //  a-=PI/8;
    //  curveVertex(x,y);
    //}
    //endShape();
    n++;
  }
  
    
  endRecord();
  noLoop();
}

void mouseReleased() {
  loop();
}