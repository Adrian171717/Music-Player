//Library: use Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
//
void setup () {
  //size(500, 600); //Remind you of Display Geometry
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  song1 = minim.loadFile("../FreeWare Music/MusicDownload/Quality_Control_Lil_Baby_DaBaby_-_Baby_Connectloaded.com.mp3"); //able to pass absolute path, file name & extension, and URL
}//End setup
//
void draw() {}//End draw
//
void keyPressed() {
  //Key Board Short Cuts
  //First Play Button
  if ( key=='P' || key=='p' ) song1.play(); //Parameter is milli-seconds from start of audio file to start playing
  //Second Play Button, Loop ONCE
  if ( key=='L' || key=='l'  ) song1.loop(1); //Parameter is Parameter is number of repeats
  //
}//End keyPressed
//
void mouseClicked() {}//End mousePressed
//
//End Main Programp
