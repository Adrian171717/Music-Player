/*
//Global Variables
PFont font;
color ink, blueInk = #1217FF, whiteInk = #FFFFFF;
int alignHorizontal, alignVertical;
String string = "Immortal - 21 Savage", stringAlternate = "";

//
void textSetup() {
  font = createFont ("Arial", 55);
}// End textSetup
//
void preTextDraw( float height, color ink, int alignHorizontal, int alignVertical, PFont font ) {
  fill(ink);
  textAlign (alignHorizontal, alignVertical);
  textFont(font, height);
}// End preTextDraw
void textDraw( float height, color ink, int alignHorizontal, int alignVertical, PFont font, String string, float rectX, float rectY, float rectWidth, float rectHeight ) {
  preTextDraw( height, ink, alignHorizontal, alignVertical, font );
  textSize(textCalculator(height, string, rectWidth));
  text(string, rectX, rectY, rectWidth, rectHeight);
  textReset();
}// End textDraw
//
void textReset() {
  fill(whiteInk);
}// End textReset
//
float textCalculator( float size, String string, float rectWidth ) {
  textSize(size);
  while ( textWidth(string) > rectWidth )
  {
    size = size * 0.99;
    textSize(size);
  }
  return size;
}// End textCalculator
//
void textKeyPressed() {
}// End textKeyPressed
//
void textMousePressed() {
}// End textMouseRPessed
//
//End Text SubProgram
*/
