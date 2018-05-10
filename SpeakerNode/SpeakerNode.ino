#include <ESP8266WiFi.h>

#define output 13
#define ArrayLength 1000
const char* ssid = "NodeMCU";
const char* password = "password1";
String Message;
WiFiClient client;
WiFiServer server(5204);

int timer = 0;
int timeOut = 300;
String NUM = "1000";
String host = "192.168.1.2";

String state = "RECIEVING"; //WAITING _ RECIEVING _ OUTPUT _


void setup() {
  Serial.begin(115200);
  Serial.println();
  Serial.printf("Connecting to %s ", ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println(" connected");
  // put your setup code here, to run once:
  Serial.println(WiFi.localIP());
  delay(1000);
  server.begin();

  //Setting up the pins for the LED TEST
  pinMode(output, OUTPUT);
}

void GetNum(){
  if(NUM.toInt() == 1000){
    if(client.connect(host, 5204)){
      Serial.println("Connected");
      Connected();
      Serial.println("\n[Disconnected]");
    }
    else{
      Serial.println("connection failed!");
    }
    delay(100);
  }
  
}

void loop() {
  GetNum();
  //SvrLoop();

}

void Connected(){
  while (client.connected()){
    ReceivingData();
  }
}
