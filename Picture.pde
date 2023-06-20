//Global Variables
float imageX, imageY, imageWidth, imageHeight, imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight;
PImage pic;
//
void backgroundImage() {
  imageBackgroundX = width*0;
  imageBackgroundY = width*0;
  imageBackgroundWidth = width;
  imageBackgroundHeight = width;
  rect( imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight );
  pic = loadImage("//FS-052/studuser$/Gr11/a.bett/My Documents/My Pictures/Saved Pictures/dlot5oqcj65aqy7c.jpg");
  image( pic, imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight );
  //End Main Program
}
