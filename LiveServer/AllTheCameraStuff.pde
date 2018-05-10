import processing.video.*;

float ratio;
Capture cam;

void setupCams(){
  String[] cameras = Capture.list();
  for(int i = 0; i < cameras.length; i ++){
     println(i +cameras[i]); 
  }
  cam = new Capture(this, cameras[97]);
  cam.start();
}

void drawCam(){
  if(cam.available()){
   cam.read();
   float cw = cam.width;
   ratio = (width/cw); 
  }
  image(cam,0,0,width,height); 
}
