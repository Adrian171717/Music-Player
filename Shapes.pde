//Global Variables
int appWidth = width, appHeight = height;
float pauseX1, pauseY1, pauseX2, pauseY2, pauseWidth, pauseHeight;
float pauseScaleWidth, pauseScaleHeight;
float playX1, playY1, playX2, playY2, playX3, playY3;
float prevX1A, prevY1A, prevX2A, prevY2A, prevX3A, prevY3A, prevX1B, prevY1B, prevX2B, prevY2B, prevX3B, prevY3B;
float nextX1A, nextY1A, nextX2A, nextY2A, nextX3A, nextY3A, nextX1B, nextY1B, nextX2B, nextY2B, nextX3B, nextY3B;
float stopX, stopY, stopWidth, stopHeight;
float muteX, muteY, muteWidth, muteHeight, muteX1, muteY1, muteX2, muteY2, muteX3, muteY3;
float muteL1X1, muteL1Y1, muteL1X2, muteL1Y2;
float muteL2X1, muteL2Y1, muteL2X2, muteL2Y2;
color resetcolourNightMode=#FFFF4B;
color black=#000000; //Night mode friendly
color resetcolourDayMode=#FFFFFF; //Not night mode friendly
//
void drawMusicButtons() {
  drawPauseButton();
  drawPlayButton();
  drawPrevButton();
  drawNextButton();
  drawStopButton();
  drawMuteButton();
}//End drawMusicButtons
//
void drawPauseButton() {
  rect( pauseX1, pauseY1, pauseWidth, pauseHeight );
  rect( pauseX2, pauseY2, pauseWidth, pauseHeight );
  float musicButtonDrawX = width * 1/2;
  float musicButtonDrawY = height * 1/2;
  pauseScaleWidth = 1.0/20.0; //Used to change the x-axis
  pauseScaleHeight = 1.0/3.0; //Used to change the y-axis
  println(pauseScaleWidth);
  pauseWidth = width * pauseScaleWidth*3/4;
  pauseX1 = musicButtonDrawX - pauseWidth - pauseWidth*1/2;
  pauseY1 = musicButtonDrawY + height * 2/10;
  pauseX2 = musicButtonDrawX + pauseWidth*1/2;
  pauseY2 = pauseY1;
  pauseHeight = (height * pauseScaleHeight)*9/15;
}//End drawPauseButton()
//
void drawPlayButton() {
  triangle( playX1, playY1, playX2, playY2, playX3, playY3 );
  playX1 = pauseX1;
  playY1 = pauseY1;
  playX3 = playX1;
  playY3 = pauseY1 + pauseHeight;
  playX2 = pauseX2 + pauseWidth;
  playY2 = (playY3 - playY1)*1/2 + playY1;
}//End drawPlayButton
//
void drawPrevButton() {
  triangle( prevX1A, prevY1A, prevX2A, prevY2A, prevX3A, prevY3A );
  triangle( prevX1B, prevY1B, prevX2B, prevY2B, prevX3B, prevY3B );
  prevX2A = playX2 - appWidth * 18/60;
  prevY2A = playY2;
  prevX1A = prevX2A + pauseHeight * 1/2;
  prevY1A = prevY2A + appHeight * 2/30;
  prevX3A = prevX1A;
  prevY3A = prevY2A - appHeight * 2/30;
  prevX1B = prevX1A + pauseHeight * 1/2;
  prevY1B = prevY1A;
  prevX2B = prevX1A;
  prevY2B = prevY2A;
  prevX3B = prevX1B;
  prevY3B = prevY3A;
}//End drawPrevButton
//
void drawNextButton() {
  triangle( nextX1A, nextY1A, nextX2A, nextY2A, nextX3A, nextY3A );
  triangle( nextX1B, nextY1B, nextX2B, nextY2B, nextX3B, nextY3B );
  nextX2A = playX2 + (pauseX1 - prevX2A);
  nextY2A = prevY2A;
  nextX1A = nextX2A - pauseHeight * 1/2;
  nextY1A = prevY1A;
  nextX3A = nextX1A;
  nextY3A = prevY3A;
  nextX1B = nextX1A - pauseHeight * 1/2;
  nextY1B = prevY1B;
  nextX2B = nextX1A;
  nextY2B = prevY2B;
  nextX3B = nextX1B;
  nextY3B = prevY3B;
}//End drawNextButton
//
void drawStopButton() {
  rect( stopX, stopY, stopWidth, stopHeight );
  fill(black);
  stopHeight = pauseHeight * 3/4;
  stopWidth = stopHeight;
  stopX = nextX2A + (width - nextX2A)*3/10;
  stopY = playY2 - stopHeight*1/2;
}//End drawStopButton
//
void drawMuteButton() {
  triangle( muteX1, muteY1, muteX2, muteY2, muteX3, muteY3 );
  rect( muteX, muteY, muteWidth, muteHeight );
  line( muteL1X1, muteL1Y1, muteL1X2, muteL1Y2 );
  line( muteL2X1, muteL2Y1, muteL2X2, muteL2Y2 );
  strokeWeight(5);
  muteX1 = prevX2A - (stopX - nextX2A)*1.6;
  muteY1 = prevY1A;
  muteX2 = muteX1 - (prevX1A - prevX2A);
  muteY2 = prevY2A;
  muteX3 = muteX1;
  muteY3 = muteY1 + (muteY2 - muteY1)*2;
  muteX= muteX2 - width*1/100;
  muteY= muteY2 - (muteY3 - muteY1)*1/4;
  muteWidth = muteX1 - muteX2;
  muteHeight = (muteY3 - muteY1)*1/2;
  muteL1X1 = muteX1 + (prevX2A - muteX1)*2/10;
  muteL1Y1 = muteY1 + (muteY3 - muteY1)*3/10;
  muteL1X2 = prevX2A - (prevX2A - muteX1)*5/10;
  muteL1Y2 = muteY3 - (muteY3 - muteY1)*3/10;
  muteL2X1 = prevX2A - (prevX2A - muteX1)*5/10;
  muteL2Y1 = muteY1 + (muteY3 - muteY1)*3/10;
  muteL2X2 = muteX1 + (prevX2A - muteX1)*2/10;
  muteL2Y2 = muteY3 - (muteY3 - muteY1)*3/10;
}//End drawMuteButton
//
//End Music Player Buttons
