import processing.net.*;
Server server;
int endString = 42;

void drawServerInfo(){
 fill(color(255,0,0));
 textSize(30);
 text(server.ip(), width - 120, height - 100);
 text("Clients : "+ numOfClients,width -120, height - 50);
 textAlign(RIGHT, TOP);
 text(""+ Sending, 230, height - 90);
}

void serverEvent(Server server, Client client) {
  
  println("SomethingConnected");
  numOfClients++; 
}


void sendData(Client node, int num){
    if(node.active()==true){
      if(sendDataCount.get(num)<durration){
       int tmpData = int(map(sendData.get(num),0,360,100,50000));
       println("Sending" + tmpData);
       node.write(tmpData+"/");
     }
    }
}
