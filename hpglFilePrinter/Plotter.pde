import processing.serial.*;

static class Plotter {
  Serial port;
  //Plotter dimensions
  int xMin = 170;
  int yMin = 602;
  int xMax = 15370;
  int yMax = 10602;
  int val;          // Data received from the serial port
  
  boolean bufferFull=false;
  boolean PLOTTING_ENABLED=true;

  StringList hpglBuffer;
  
  PApplet app;
  
  Plotter(PApplet papp, Serial _port){
    port = _port;
    app=papp;
    app.registerMethod("serialEvent",this);
  }
  
  void flushBuffer(){
    if(!bufferFull){
      println("Flushing Buffer");

      while(hpglBuffer.size() > 0){
        println("  writing buffered command...");
        port.write(hpglBuffer.remove(0));
        if(bufferFull){ // Stop if we've filled the plotters buffer!  TODO:  If events don't fire when they happen but at the "end" of a draw loop this won't work
          app.delay(100);
          flushBuffer();
        }
      }
      
    }
  }
  
  void write(String hpgl){
    if (PLOTTING_ENABLED){
      if(!bufferFull){
        
        if(hpglBuffer.size()>0){
          flushBuffer();
        }
        
        port.write(hpgl);
        
      }else{
        hpglBuffer.append(hpgl);
      }
    }
  }
  
  void plotCommands(String[] commands){
    println("Plotting ", commands.length, " commands");
    for(int i=0; i < commands.length; i++){
      write(commands[i]);
    }
  }
  
  void serialEvent(Serial p) {
    char serialChar = p.readChar();
  
    if (serialChar == 19) {
      bufferFull = true;
      println("Buffer full");
    }
    if (serialChar == 17) {
      bufferFull = false;
      println("Buffer empty");
  }
}
  

}