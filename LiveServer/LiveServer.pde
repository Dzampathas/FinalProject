Button button1;
Button button2;
Button button3;

boolean Sending = false;

int durration = 70;

ArrayList<Integer> sendData = new ArrayList<Integer>();
ArrayList<Integer> sendDataOld = new ArrayList<Integer>();
ArrayList<Integer> sendDataCount = new ArrayList<Integer>();

int sendingTimer = 0;
int sendingTimeOut = 2000;

int reset = 0;
int resetTimer = 360000;


void setup(){
  size(1280,720);
  //fullScreen();
  setupCams();
  for(int i = 0; i < 100; i++){
   sendData.add(i,0);
   sendDataOld.add(i,0);
   sendDataCount.add(i,0); 
  }
  init();
}

void buttons(){
  button1.update();
  button2.update();
  button3.update();
  
  if(button1.clicked() == true){
   exit();
  }
  if(button3.clicked() == true){
   init();
  }
  if(button2.clicked() == true){
   Sending = !Sending;
  }
  
}

void init(){
  if(server != null){
    if(server.active() == true){
      server.stop();
    }
  }
  server = new Server(this, 5204);
  button1 = new Button(30,30,"X");
  button2 = new Button(30,height-100, "Send Data");
  button3 = new Button(30,100,"R");
  button1.W = 50;
  button1.H = 50;
  colorMode(HSB);
  numOfClients = 0; // TEST SIZE
}


void draw(){
  //println(server.ip());
  //println(server.clients[0]);
  if(numOfClients>0){
    background(255);
    drawCam();
    calcDivisions();
    if(UI != null){
      image(UI,0,0);
    }
    for(int i = 0; i < numOfClients ; i ++){
      if(Sending ==true && millis()-sendingTimer > sendingTimeOut){
        println("poop");;
        sendingTimer = millis();
        sendData(server.clients[i],i);
      }
    }
    drawServerInfo();
    buttons();
  }else{
    textSize(100);
    fill(0,0,0);
    text("NO CLIENTS",width/2,height/2);
    background(0,255,255);
  }
  if(millis()-reset>resetTimer){
    println("reset");
    init();
    reset = millis();
  }
  
}
