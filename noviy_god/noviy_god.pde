import processing.sound.*; 
SoundFile file; 


import processing.sound.*; 

FFT fft; //для музыки 
AudioIn in; 
int bands = 512; 
float[] spectrum = new float[bands]; 

class Snowflake { //класс снежинок 
float x, y; 
int z; 
Snowflake() { 
z = (int)random(0,8); 
x = random(0,width); 
y = random(-height,0)*z*0.25; 
} 

void fall() { //снежинки 
noStroke(); 
fill(253,255,250,z*20); 
ellipse(x,y,5,5); 
y += z*0.15 ; 
x += random(-1,1)*(z*0.03); 
} 
} 
Snowflake[] flakes; 
void setup() { 
size(1200,650); 
file = new SoundFile (this, "C:/Users/DNS/Desktop/demoscena/mix.mp3"); 
file.play(); 
smooth(); 

fft = new FFT(this, bands); //для музыки 
in = new AudioIn(this, 0); 
in.start(); 
fft.input(in); 

flakes = new Snowflake[250]; //для снежинок 
for(int i = 0; i < 250; i++) flakes[i] = new Snowflake(); 

} 
void draw() { 
background(8,37,103); 
fill(255,250,250); 
rect(0,550,1200,650); 


for(int i = 0; i < 250; i++) { //для движения снежинок 
flakes[i].fall(); 
if(flakes[i].y > height + 20) flakes[i] = new Snowflake(); 
} 
}