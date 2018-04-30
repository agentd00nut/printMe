class PenShape{
  PVector origin;
  float rotation;
  ArrayList<PVector> points; // All points relative to origin
  StringList commands;

  PVector unitSize;
  
  void command(String cmd, float x, float y){
    commands.append(  cmd+(x*unitSize.x)+","+(y*unitSize.y)+";" );
  }
  
  void command(String cmd){
    commands.append(  cmd );
  }
  
  void point(float x, float y){
    points.add( new PVector( x, y ) );
  }
  
  void scale(float n){
    for(int i=0; i<points.size(); i++){
      PVector p = points.get(i);
      p.mult(n);
      points.set(i,p);
    }
    commands.clear();
  }
  
    void display(int displayMod){
    pushMatrix();
    translate(origin.x, origin.y);
    beginShape();
    PVector p;
    for(int i=0; i<points.size(); i++){
      p=points.get(i);
      vertex(p.x*displayMod,p.y*displayMod);
    }
    endShape();
    popMatrix();
  }
}