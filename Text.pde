//Global Variables
//
void textSetup() {
  if ( currentSong == 0 ) {
    song = "cocoa - Baby Keem";
  } else if ( currentSong == 1 ) {
    song = "Baby - Lil Baby";
  } else if ( currentSong == 2 ) {
    song = "Family Ties - Baby Keem";
  } else if ( currentSong == 3 ) {
    song = "Feel The Fiyaaaah - Metro Boomin";
  } else if ( currentSong == 4 ) {
    song = "XO Tour Llif3 - Lil Uzi";
  }
  //
  int intPosition = songs[currentSong].position();
  int minute1 = (intPosition/1000)/60;
  int second1 = (intPosition/1000)-((intPosition/1000)/60 * 60);
  String colon1 = ":" ;
  String posMinute = Integer.toString(minute1);
  String posSecond;
  if ( second1 <= 9 ) {
    posSecond = 0+Integer.toString(second1);
  } else {
    posSecond = Integer.toString(second1);
  }
  songPosition = posMinute+colon1+posSecond;
  //
  int intLength = songs[currentSong].length();
  int minute2 = (intLength/1000)/60;
  int second2 = (intLength/1000)-((intLength/1000)/60 * 60);
  String colon2 = ":" ;
  String songMinute = Integer.toString(minute2);
  String songSecond;
  if ( second2 <= 9 ) {
    songSecond = 0+Integer.toString(second2);
  } else {
    songSecond = Integer.toString(second2);
  }
  songLength = songMinute+colon2+songSecond;
  //
  if ( loop == 1) {
    loopText = "Loop: None";
  } else if ( loop == 2 ) {
    loopText = "Loop: Song";
  } else if ( loop == 3 ) {
    loopText = "Loop: Playlist";
  }
  //
  font1 = createFont ("Arial", 50);
  font2 = createFont ("Arial", 25);
  font3 = createFont ("Arial", 45);
  font4 = createFont ("Arial", 35);
  textAlign (CENTER, CENTER);
  //
  textFont(font1);
  text(song, textX1, textY1, textWidth1, textHeight1);
  //
  textFont(font2);
  text(songPosition, textX2, textY2, textWidth2, textHeight2);
  //
  textFont(font2);
  text(songLength, textX3, textY3, textWidth3, textHeight3);
  //
  textFont(font3);
  text(rewind, textX4, textY4, textWidth4, textHeight4);
  //
  textFont(font3);
  text(forward, textX5, textY5, textWidth5, textHeight5);
  //
  textFont(font4);
  text(loopText, textX6, textY6, textWidth6, textHeight6);
}
