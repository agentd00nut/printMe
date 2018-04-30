import hpglgraphics.*;

String file="";

String[] commands;

Plotter plotter;
Serial port;
int lf = 10;      // ASCII linefeed

void initPlotter(){
    String portName = Serial.list()[0];
  
  port = new Serial(this, portName, 9600);
  port.bufferUntil(lf);
  
  plotter = new Plotter(this,port);
}







void setup(){
  size(1000,800);
  initPlotter();
  
  commands = loadStrings(file);
  plotter.plotCommands(commands);
}