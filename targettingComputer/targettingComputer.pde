import hpglgraphics.*;
PenSquare s;

int xMax=10700;
int yMax=7800;

int gridsX=6;
int gridsY=2;

//int gridX=width/(gridsX+1);
//int gridY=height/(gridsY+1);

int gridX=100;
int gridY=100;

int stepX=10;
int stepY=10;

void setup(){
  
  size(1000,600);
  noFill();
  for(int i=0; i<gridsY; i++){
    for(int j=0; j<gridsX; j++){
      
      generateGrid(j*gridX,i*gridY);
      
    }
  }
}

boolean checkBounds(float x, float y){
  if( x >= gridX  || y >= gridY ){ return false; } 
  return true;
}

void generateGrid(float offX, float offY){
  strokeWeight(3);
  rect(offX, offY, gridX, gridY);
  strokeWeight(1);
  for(int n=0; n<random(3,15); n++){
    
    int item=floor( random(0,2) );
    float x = random(0, gridX);
    float y = random(0, gridY);
    while(!checkBounds(x,y)){
      x = random(0, gridX);
      y = random(0, gridY);
    }
    
    if(item == 1){
      
      int w = floor( map(random(1,8), 1, 8, 1, stepX) );
      while(!checkBounds(x+w, y+w)){
        w = floor( map(random(1,8), 1, 8, 1, stepX) );
      }
      
      rect(x+offX, y+offY, w,w);
    }
    
  }
}






//void setup() {
//  size(800, 800);

//  stroke(0);
//  background(255);
//  noFill();

//  // HPGL (Roland DXY-1350A) coordinate ranges:
//  // A4 : 11040 x 7721 (297 x 210 mm)
//  // A3 : 16158 x 11040 (420 x 297 mm)

//  HPGLGraphics hpgl = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
//  hpgl.setPaperSize("A4");
//  hpgl.setPath("output.hpgl");

//  beginRecord(hpgl);
  

//  int gridSize=10;
//  PVector min = new PVector(100,100);
//  PVector max = new PVector(0,0);;
  
//  for(int i=0; i< random(3,6); i++){
//    pushMatrix();
//    translate(width/2,height/2);
//    int scale = floor( random( 1, 8) );
//    int x = floor( map(  random(1,100), 1, 100, 1, gridSize) );
//    int y = floor( map(  random(1,100), 1, 100, 1, gridSize) );
    
    
    
//    s=new PenSquare(x*gridSize,y*gridSize,0);
//    s.scale(scale*10);
    
//    if(x < min.x){ min.x = x; }
//    if(x > max.x){ max.x = x; }
    
//    if(y < min.y){ min.y = y; }
//    if(y > max.y){ max.y = y; }
    
//    s.display(1);
//    popMatrix();
//  }
  
//  pushMatrix();
//  translate(width/2,height/2);
//  strokeWeight(2);
//  s=new PenSquare(min.x, min.y, 0);
//  s.scale(max(max.x, max.y)*10);
//  s.display(1);
//  popMatrix();
//  println(min.x,min.y,max.x,max.y);
//  endRecord();
//}

void draw() {
  //s.display(10);
}