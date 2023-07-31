float An;
int Dig=3;
int AnlR= A0;
int G1=2,G2=3,Y1=4,Y2=5,Y3=6,R1=7,R2=8,GB=11,RB=10;
boolean GBS,RBS;
void setup() {
  pinMode(Dig,INPUT);
  pinMode(GB,INPUT);
  pinMode(RB,INPUT);
  pinMode(G1,OUTPUT);
  pinMode(G2,OUTPUT);
  pinMode(Y1,OUTPUT);
  pinMode(Y2,OUTPUT);
  pinMode(Y3,OUTPUT);
  pinMode(R1,OUTPUT);
  pinMode(R2,OUTPUT);
  Serial.begin(9600);
  GBS=false;
  RBS=false;
  
}

void loop() {
  // In charge of LED bar
  An=analogRead(AnlR);
  An=map(An,400,513,0,255);
  if(An<=255)
  {
  Serial.println(An);
  digitalWrite(G1,HIGH);
  if(An<=230)
   {
    digitalWrite(G2,HIGH);
    if(An<=210)
     {
      digitalWrite(Y1,HIGH);
      if(An<=190)
      {
        digitalWrite(Y2,HIGH);
        if(An<=170)
        {
          digitalWrite(Y3,HIGH);
          if(An<=150)
          {
            digitalWrite(R1,HIGH);
            if(An<=130)
            {
              digitalWrite(R2,HIGH);
            }
          }
        }
      }
     }
   }
  }
  else
  {
    digitalWrite(G1,LOW);
    digitalWrite(G2,LOW);
    digitalWrite(Y1,LOW);
    digitalWrite(Y2,LOW);
    digitalWrite(Y3,LOW);
    digitalWrite(R1,LOW);
    digitalWrite(R2,LOW);
  }
  //handles button signal on the serial monitor
  if(digitalRead(GB)==HIGH&& GBS==false)
  {
    GBS=true; 
    Serial.println("G");
  }
  else if(digitalRead(GB)==LOW)
    GBS=false;
  if(digitalRead(RB)==HIGH&& RBS==false)
  {
    RBS=true; 
    Serial.println("R");
  }
  else if(digitalRead(RB)==LOW)
    RBS=false;

  delay(5);
}
