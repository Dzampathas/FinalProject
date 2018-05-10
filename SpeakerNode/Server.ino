void SvrLoop(){
  if(NUM.toInt() != 1000){
    //Serial.println("I'm HOSTING");
    WiFiClient Computer = server.available();
    if(Computer){
      //Serial.println("Client Connected");
      while(Computer.connected()){
        Computer.write("sending*");
        if(Computer.available()){
          Message = getMessage(Computer);
          Output();
          Serial.print("Message is ="); Serial.println(Message);
          delay(100);
        }
      }
    }
  }
}

