import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
//
void setup() {
  size(1050, 600);
  setupMusic();
  songs[currentSong].loop(0); 
}//End setup
//
void draw() {
  drawMusicButtons();
  drawMusic();
}//End draw
//
void keyPressed() {
  keyPressedMusic();
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN Program
