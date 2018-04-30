class PenLine extends PenShape{
  PenLine(float x, float y, float _rotation){
    origin= new PVector(x,y);
    rotation=_rotation;
    points=new ArrayList<PVector>();
    commands=new StringList();
    
    unitSize= new PVector( map(1, 0, width, 0, xMax), map(1, 0, height, 0, yMax) );
    
    initPoints();
    generateCommands();
  }
  
  
  void initPoints(){
    point(0,0);
    point(1,1);
  }
  
   
  void generateCommands(){   
    command( "PA", origin.x*unitSize.x, origin.y*unitSize.y );
    command("PR");
    PVector p;
    for(int i=0; i<points.size(); i++){
      p=points.get(i);
      command( "PD", p.x,p.y );
    }
  }
  

}