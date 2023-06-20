void drawMusicButtons() {
  drawPrevButton();
  drawNextButton();
  drawStopButton();
  drawQuitButton();
  drawPositionButton();
  drawRewindButton();
  drawForwardButton();
}//End drawMusicButtons
//
void drawPauseButton() {
  rect( pauseX1, pauseY1, pauseWidth, pauseHeight );
  rect( pauseX2, pauseY2, pauseWidth, pauseHeight );
}//End drawPauseButton()
//
void drawPlayButton() {
  triangle( playX1, playY1, playX2, playY2, playX3, playY3 );
}//End drawPlayButton
//
void drawPrevButton() {
  triangle( prevX1A, prevY1A, prevX2A, prevY2A, prevX3A, prevY3A );
  triangle( prevX1B, prevY1B, prevX2B, prevY2B, prevX3B, prevY3B );
}//End drawPrevButton
//
void drawNextButton() {
  triangle( nextX1A, nextY1A, nextX2A, nextY2A, nextX3A, nextY3A );
  triangle( nextX1B, nextY1B, nextX2B, nextY2B, nextX3B, nextY3B );
}//End drawNextButton
//
void drawStopButton() {
  rect( stopX, stopY, stopWidth, stopHeight );
  fill(black);
}//End drawStopButton
//
void drawMutedButton() {
  triangle( muteX1, muteY1, muteX2, muteY2, muteX3, muteY3 );
  rect( muteX, muteY, muteWidth, muteHeight );
  line( muteL1X1, muteL1Y1, muteL1X2, muteL1Y2 );
  line( muteL2X1, muteL2Y1, muteL2X2, muteL2Y2 );
  strokeWeight(5);
}//End drawMuteButton
//
void drawUnmutedButton() {
  triangle( unmuteX1, unmuteY1, unmuteX2, unmuteY2, unmuteX3, unmuteY3 );
  rect( unmuteX, unmuteY, unmuteWidth, unmuteHeight );
  line( unmuteL1X1, unmuteL1Y1, unmuteL1X2, unmuteL1Y2 );
  line( unmuteL2X1, unmuteL2Y1, unmuteL2X2, unmuteL2Y2 );
  strokeWeight(5);
}//End drawUnmuteButton
//
void drawQuitButton() {
  line( quit1X1, quit1Y1, quit1X2, quit1Y2 );
  line( quit2X1, quit2Y1, quit2X2, quit2Y2 );
  strokeWeight(7);
}
//
void drawPositionButton() {
  line( positionX1, positionY1, positionX2, positionY2 );
}//End drawPositionButton
//
void drawRewindButton() {
  triangle( rewindX1A, rewindY1A, rewindX2A, rewindY2A, rewindX3A, rewindY3A );
  triangle( rewindX1B, rewindY1B, rewindX2B, rewindY2B, rewindX3B, rewindY3B );
}//End drawPositionButton
//
void drawForwardButton() {
  triangle( forwardX1A, forwardY1A, forwardX2A, forwardY2A, forwardX3A, forwardY3A );
  triangle( forwardX1B, forwardY1B, forwardX2B, forwardY2B, forwardX3B, forwardY3B );
}//End drawForwardButton
//End Music Player Buttons
