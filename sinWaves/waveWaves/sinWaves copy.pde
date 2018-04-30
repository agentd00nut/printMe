import hpglgraphics.*;

void setup() {
  size(800, 800);

  stroke(0);
  background(255);
  noFill();

  // HPGL (Roland DXY-1350A) coordinate ranges:
  // A4 : 11040 x 7721 (297 x 210 mm)
  // A3 : 16158 x 11040 (420 x 297 mm)

  HPGLGraphics hpgl = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  hpgl.setPaperSize("A4");
  hpgl.setPath("output.hpgl");

  // (most) things between begin- and endRecord are written to the .hpgl file
  beginRecord(hpgl);

  translate(5,25);
  int cellsize=750;
  float a=TWO_PI/10;  
  float incr=2;
  pushMatrix();

  for (float offY=incr; offY<cellsize; offY+=incr) {

    float lx=0;
    float ly=offY;

    for (float i=0; i<cellsize; i+=1) {
      //float y=sin(a+offY)*(i/18);
      float y=sin(a+offY)*12;
      if (i==0) {
        line(0, y+offY, i, y+offY);
      } else {
        line(lx, ly+offY, i, y+offY);
      }


      a+=TWO_PI/(200-(offY/10));
      //a+=TWO_PI/(8000-(offY*24)); // "Screaming"
      //a+=TWO_PI/(500-(offY*1.5));
      lx=i;
      ly=y;
    }
    //rotate(.001);
  }

  popMatrix();

  //for (int i=0; i<cellsize; i+=4) {
  //  line(0, i, cellsize, i); 
  //}

  //for (int j=0; j<cellsize; j+=4) {
  //  line(j,0,j,cellsize); 
  //}


  endRecord();
}

void draw() {
}