int timer2 = 0;
int playtimer = 0;


void connectToWifi() {
  Serial.printf("Connecting to %s ", ssid);
  //WiFi.config(ip, gateway, subnet);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println(" connected");

}

void ReceivingData() {
  //end sending the Server Info
  //reciving stuff from the server
  Message = getMessage(client);
  if(Message != ""){
      Serial.println(Message);
    //if (NUM.toInt() == 1000) {
      //NUM = Message.toInt();
      Output();
      digitalWrite(output, LOW);
  }
    //Serial.print("Number is"); Serial.println(NUM);
    //client.stop(); 
  //}
  //Serial.println("Waiting");
}

void Output() {
  timer2 = millis();
      int duration = 200;
      Serial.println("I'm Playing my song");
      while (millis() - timer2 < duration) {
        if (micros() - playtimer <Message.toInt()*2) {
          digitalWrite(output, HIGH);
        } else {
          digitalWrite(output, LOW);
          if (micros() - playtimer > Message.toInt()*6) {
            playtimer = micros();
          }
        }
      }
}

String getMessage(WiFiClient CLIENT) {
  String message = "";
  if (CLIENT.available() > 0) {
    message = CLIENT.readStringUntil(47);
    Serial.println(message);
  }
  return message;
}

