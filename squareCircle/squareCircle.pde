import hpglgraphics.*;

int lines = 30;

void setup() {

  size(1104, 772);

  HPGLGraphics hpgl = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  //HPGLGraphics hp2 = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  hpgl.setPaperSize("A4");
  hpgl.setPath("output.hpgl");

  background(255);
  beginRecord(hpgl);
  
  translate(width/2, height/2);
  float a=0;
  float x=0;
  float y=0;
  
  float r=300;
  float lX=r;
  float lY=0;
  
  
  while(a<TWO_PI){
    x=cos(a)*r;
    y=sin(a)*r;
    //line(lX,0,x,y);
    if(a == 0){
      //point(x,y);
    }else{
      //line(lX,lY,x,y);
    }
    lX=x;
    lY=y;
    a+=TWO_PI/40;
  }
  a=0;
  x=cos(a)*r;
  y=sin(a)*r;
  //line(lX,lY,x,y);
  
  while(a<TWO_PI){
    x=cos(a)*r;
    y=sin(a)*r;
        
    // diagnal lines
    if(a >= PI+PI/2){
      line(x,y, cos(a+PI)*r, sin(a+PI)*r);
    }
    
    // vertical lines
    if(a >= PI+PI/2){
      line(cos(-a)*r, sin(-a)*r, x, 0);
    }
    
    // horizontal lines
    if(a >= PI+PI/2 || a==0){
      line(cos(-a+PI)*r, sin(-a+PI)*r,0,y);
    }
    
    a+=TWO_PI/180;
  }
  
  endRecord();
  //image(x,0,0);  
  
}

void draw() {
}