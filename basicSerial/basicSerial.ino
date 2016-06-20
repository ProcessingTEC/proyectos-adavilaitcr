void setup() {
  // put your setup code here, to run once:
  pinMode(A0, INPUT);
  pinMode(A2, INPUT);
  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  //cada cuatro microsegundos
  Serial.print(analogRead(A0));
  Serial.print(",");
  Serial.println(analogRead(A2));
  //delay(10);
}
