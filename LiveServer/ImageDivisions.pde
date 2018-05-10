int vertDiv;
int horzDiv;
boolean odd;
PGraphics UI;

int numOfClients;



void calcDivisions() {
  ///numOfClients = server.clients.length;
  UI = createGraphics(width, height);
  UI.beginDraw();
  UI.clear();
  odd = (Math.pow(sqrt(numOfClients), 2) != numOfClients);
  if (numOfClients>0) {
    vertDiv = floor(sqrt(numOfClients)); //3
    horzDiv = ceil(float(numOfClients)/float(vertDiv)); //2
  } else {
    horzDiv = 1;
    vertDiv = 1;
  }
  for (int i = 0; i < numOfClients; i ++) {
    if (sendDataCount.get(i) == null) {
      sendDataCount.add(i, 0);
    }
    if (sendDataOld.get(i) == null) {
      sendDataOld.add(i, 0);
    }
    if (sendData.get(i) == null) {
      sendData.add(i, 0);
    }
    int h = height/vertDiv;
    int w = width/horzDiv;
    int x;
    int y;
    y = ((i)/horzDiv)* h;
    x = ((i)%horzDiv)* w;
    int tmp = (numOfClients) - (vertDiv-1)*horzDiv;
    if (i > (numOfClients-1) - tmp && odd) {
      //println("bleh" );
      w = width/tmp;
      y = (vertDiv-1)* h;
      x = ((i)%tmp)* w;
    }
    //send data stuff
    if (ratio>0) {
      sendData.add(i, imageAna(cam.get(int(x/ratio), int(y/ratio), int(w/ratio), int(h/ratio))));
      UI.colorMode(RGB);
      if (int(sendDataOld.get(i)) == int(sendData.get(i))) {
        sendDataCount.add(i, sendDataCount.get(i)+1);
      } else {
        sendDataCount.add(i, 0);
      }
      if (sendDataCount.get(i)>durration) {
        UI.stroke(255, 0, 0);
      } else {
        UI.stroke(0, 255, 0);
      }
      //println("Ah1");
      UI.strokeWeight(10);
      UI.colorMode(HSB);
      //println(ratio);
      UI.fill(sendData.get(i), 255, 255, 200);
      sendDataOld.set(i, sendData.get(i));
    }
    UI.rect(x, y, w, h);
    UI.fill(0);
    UI.textAlign(CENTER, CENTER);
    if (ratio>0) {
      UI.text(""+sendData.get(i), x+w/2, y+h/2);
    }
  }
  UI.endDraw();
}
