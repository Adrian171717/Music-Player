//Global Variables
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
Minim minim;
AudioPlayer[] songs = new AudioPlayer[5];
String pathway, cocoa, Baby, FamilyTies, FeelTheFiyaaaah, XOTourLlif3, playingSong;
int currentSong=2, loop=1;
Boolean playing=false, muted=false;
float musicButtonDrawX, musicButtonDrawY;
float pauseX1, pauseY1, pauseX2, pauseY2, pauseWidth, pauseHeight;
float pauseScaleWidth, pauseScaleHeight;
float playX1, playY1, playX2, playY2, playX3, playY3;
float prevX1A, prevY1A, prevX2A, prevY2A, prevX3A, prevY3A, prevX1B, prevY1B, prevX2B, prevY2B, prevX3B, prevY3B;
float nextX1A, nextY1A, nextX2A, nextY2A, nextX3A, nextY3A, nextX1B, nextY1B, nextX2B, nextY2B, nextX3B, nextY3B;
float stopX, stopY, stopWidth, stopHeight;
float muteX, muteY, muteWidth, muteHeight, muteX1, muteY1, muteX2, muteY2, muteX3, muteY3, muteL1X1, muteL1Y1, muteL1X2, muteL1Y2, muteL2X1, muteL2Y1, muteL2X2, muteL2Y2;
float unmuteX, unmuteY, unmuteWidth, unmuteHeight, unmuteX1, unmuteY1, unmuteX2, unmuteY2, unmuteX3, unmuteY3, unmuteL1X1, unmuteL1Y1, unmuteL1X2, unmuteL1Y2, unmuteL2X1, unmuteL2Y1, unmuteL2X2, unmuteL2Y2;
float quit1X1, quit1Y1, quit1X2, quit1Y2, quit2X1, quit2Y1, quit2X2, quit2Y2;
float positionX1, positionY1, positionX2, positionY2;
float rewindX1A, rewindY1A, rewindX2A, rewindY2A, rewindX3A, rewindY3A, rewindX1B, rewindY1B, rewindX2B, rewindY2B, rewindX3B, rewindY3B;
float forwardX1A, forwardY1A, forwardX2A, forwardY2A, forwardX3A, forwardY3A, forwardX1B, forwardY1B, forwardX2B, forwardY2B, forwardX3B, forwardY3B;
color black=#000000;
float textX1, textY1, textWidth1, textHeight1, textX2, textY2, textWidth2, textHeight2, textX3, textY3, textWidth3, textHeight3, textX4, textY4, textWidth4, textHeight4, textX5, textY5, textWidth5, textHeight5, textX6, textY6, textWidth6, textHeight6;
PFont font1, font2, font3, font4;
String song, songPosition, songLength, rewind = "5", forward = "5", loopText;
//
void setup() {
  size(1050, 600);
  setupMusic();
  songs[currentSong].loop(0);
  //
  //Population
  musicButtonDrawX = width * 1/2;
  musicButtonDrawY = height * 1/2;
  pauseScaleWidth = 1.0/20.0; //Used to change the x-axis
  pauseScaleHeight = 1.0/3.0; //Used to change the y-axis
  pauseWidth = width * pauseScaleWidth*3/4;
  pauseX1 = musicButtonDrawX - pauseWidth - pauseWidth*1/2;
  pauseY1 = musicButtonDrawY + height * 2/10;
  pauseX2 = musicButtonDrawX + pauseWidth*1/2;
  pauseY2 = pauseY1;
  pauseHeight = (height * pauseScaleHeight)*9/15;
  //
  playX1 = pauseX1;
  playY1 = pauseY1;
  playX3 = playX1;
  playY3 = pauseY1 + pauseHeight;
  playX2 = pauseX2 + pauseWidth;
  playY2 = (playY3 - playY1)*1/2 + playY1;
  //
  prevX2A = ( pauseX2 + pauseWidth ) - width * 18/60;
  prevY2A = pauseX1 + pauseWidth*1/2;
  prevX1A = prevX2A + pauseHeight * 1/2;
  prevY1A = prevY2A + height * 2/30;
  prevX3A = prevX1A;
  prevY3A = prevY2A - height * 2/30;
  prevX1B = prevX1A + pauseHeight * 1/2;
  prevY1B = prevY1A;
  prevX2B = prevX1A;
  prevY2B = prevY2A;
  prevX3B = prevX1B;
  prevY3B = prevY3A;
  //
  nextX2A = ( pauseX2 + pauseWidth ) + (pauseX1 - prevX2A);
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
  //
  stopHeight = pauseHeight * 3/4;
  stopWidth = stopHeight;
  stopX = nextX2A + (width - nextX2A)*3/10;
  stopY = ( pauseX1 + pauseWidth*1/2 ) - stopHeight*1/2;
  //
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
  muteL1X1 = muteX1 + (prevX2A - muteX1)*3/20;
  muteL1Y1 = muteY1 + (muteY3 - muteY1)*3/10;
  muteL1X2 = prevX2A - (prevX2A - muteX1)*11/20;
  muteL1Y2 = muteY3 - (muteY3 - muteY1)*3/10;
  muteL2X1 = muteL1X2;
  muteL2Y1 = muteL1Y1;
  muteL2X2 = muteL1X1;
  muteL2Y2 = muteL1Y2;
  //
  unmuteX1 = prevX2A - (stopX - nextX2A)*1.6;
  unmuteY1 = prevY1A;
  unmuteX2 = unmuteX1 - (prevX1A - prevX2A);
  unmuteY2 = prevY2A;
  unmuteX3 = unmuteX1;
  unmuteY3 = unmuteY1 + (unmuteY2 - unmuteY1)*2;
  unmuteX = unmuteX2 - width*1/100;
  unmuteY = unmuteY2 - (unmuteY3 - unmuteY1)*1/4;
  unmuteWidth = unmuteX1 - unmuteX2;
  unmuteHeight = (unmuteY3 - unmuteY1)*1/2;
  unmuteL1X1 = unmuteX3 + width*1/50;
  unmuteL1Y1 = unmuteY;
  unmuteL1X2 = unmuteX3 + width*1/50;
  unmuteL1Y2 = unmuteY + unmuteHeight;
  unmuteL2X1 = unmuteX3 + width*2/50;
  unmuteL2Y1 = unmuteL1Y1;
  unmuteL2X2 = unmuteX3 + width*2/50;
  unmuteL2Y2 = unmuteL1Y2;
  //
  quit1X1 = width*2/100;
  quit1Y1 = 0 + (quit1X1 - width*0);
  quit1X2 = width*6/100;
  quit1Y2 = quit1Y1 + (quit1X2 - quit1X1);
  quit2X1 = quit1X2;
  quit2Y1 = quit1Y1;
  quit2X2 = quit1X1;
  quit2Y2 = quit1Y2;
  //
  positionX1 = muteX1 + (prevX2A - muteX1)*1/2;
  positionY1 = height*2/5;
  positionX2 = width - (positionX1 - width*0);
  positionY2 = positionY1;
  //
  rewindX2A = width*1/24;
  rewindY2A = positionY1 + height*1/30;
  rewindX1A = rewindX2A + width*1/20;
  rewindY1A = rewindY2A - (rewindX1A - rewindX2A)*1/2;
  rewindX3A = rewindX2A + width*1/20;
  rewindY3A = rewindY2A + (rewindY2A - rewindY1A);
  rewindX1B = rewindX1A + (rewindX1A - rewindX2A);
  rewindY1B = rewindY1A;
  rewindX2B = rewindX1A;
  rewindY2B = rewindY2A;
  rewindX3B = rewindX1B;
  rewindY3B = rewindY3A;
  //
  forwardX2A = width - (rewindX2A - width*0);
  forwardY2A = rewindY2A;
  forwardX1A = width - (rewindX1A - width*0);
  forwardY1A = rewindY1A;
  forwardX3A = width - (rewindX3A - width*0);
  forwardY3A = rewindY3A;
  forwardX1B = width - (rewindX1B - width*0);
  forwardY1B = rewindY1B;
  forwardX2B = width - (rewindX2B - width*0);
  forwardY2B = rewindY2B;
  forwardX3B = width - (rewindX3B - width*0);
  forwardY3B = rewindY3B;
  //
  textWidth1 = positionX2 - positionX1;
  textHeight1 = height*1/5;
  textX1 = width*1/2 - textWidth1*1/2;
  textY1 = height*0 + (positionY1 - height*0)*1/2 - textHeight1*1/2;
  textWidth2 = (positionX2 - positionX1)*1/10;
  textHeight2 = height*1/20;
  textX2 = positionX1;
  textY2 = positionY1 + height*1/50;
  textWidth3 = textWidth2;
  textHeight3 = textHeight2;
  textX3 = width - (textX2 - width*0) - textWidth3;
  textY3 = textY2;
  textWidth4 = (rewindX1B - rewindX2A);
  textHeight4 = height*1/10;
  textX4 = (rewindX1B - rewindX2A)*1/2;
  textY4 = rewindY1A - height*15/120;
  textWidth5 = textWidth4;
  textHeight5 = textHeight4;
  textX5 = width - (textX4 - width*0) - textWidth5;
  textY5 = textY4;
  textWidth6 = (playX2 - playX1)*2/1;
  textHeight6 = height*1/10;
  textX6 = width*1/2 - textWidth6*1/2;
  textY6 = playY1 - (playY1 - positionY1)*1/2 - textHeight6*1/2;
  //
  if ( playing==true ) {
    backgroundImage();
    drawMusicButtons();
    drawPauseButton();
    textSetup();
  } else if ( playing==false ) {
    backgroundImage();
    drawMusicButtons();
    drawPlayButton();
    textSetup();
  } else {
  }
  if ( muted == false ) {
    drawUnmutedButton();
  } else {
    drawMutedButton();
  }
  //
}//End setup
//
void draw() {
  drawMusic();
  if ( playing==true ) {
    backgroundImage();
    drawMusicButtons();
    drawPauseButton();
    textSetup();
  } else if ( playing==false ) {
    backgroundImage();
    drawMusicButtons();
    drawPlayButton();
    textSetup();
  }
  //
  if ( songs[currentSong].isPlaying() ) {
    playing = true;
  } else {
    playing = false;
  }
  if ( muted == false ) {
    drawUnmutedButton();
  } else {
    drawMutedButton();
  }
  //
}//End draw
//
void keyPressed() {
  keyPressedMusic();
  //
}//End keyPressed
//
void mousePressed() {
  mousePressedMusic();
}//End mousePressedpp
//
void concantenationOfMusicFiles() {
  pathway = "data/";
  cocoa = "cocoa.mp3";
  Baby = "Baby.mp3" ;
  FamilyTies = "Family_Ties.mp3" ;
  FeelTheFiyaaaah = "Feel_The_Fiyaaaah.mp3" ;
  XOTourLlif3 = "XO_Tour_Llif3.mp3" ;
} //End concantenation
//
void setupMusic() {
  //
  minim  = new Minim (this); //load from data directory, loadFile should also load from project folder, like loadImage
  //
  //Set the directory or Pathway to the Music
  //Pathway: data / Music or Sound Effect Files
  //
  //Reminder: finish OS_Level Code to auto read pathway and files (See Operating System)
  //
  concantenationOfMusicFiles();
  songs[0] = minim.loadFile( pathway + cocoa );
  songs[1] = minim.loadFile( pathway + Baby );
  songs[2] = minim.loadFile( pathway + FamilyTies ) ;
  songs[3] = minim.loadFile( pathway + FeelTheFiyaaaah );
  songs[4] = minim.loadFile( pathway + XOTourLlif3 ) ;
  //
} //End setupMusic
//
void drawMusic() {
  //Debugging in CONSOLE
  println( " " );
  println( "Song", currentSong, "Position:", songPosition );
  println( "Song Length:", songLength );
  if ( songs[currentSong].isMuted() ) {
    println ( "Muted" );
  } else {
    println ( "Unmuted" );
  }
  if ( songs[currentSong].isPlaying() ) {
    if ( loop == 1 ) {
      println( "Playing");
    } else if ( loop == 2 ) {
      println( "Playing,", "Looping Song");
    } else if ( loop == 3 ) {
      println( "Playing,", "Looping Playlist");
    }
  } else {
    if ( loop == 1 ) {
      println( "Paused");
    } else if ( loop == 2 ) {
      println( "Paused,", "Looping Song");
    } else if ( loop == 3 ) {
      println( "Paused,", "Looping Playlist");
    }
  }
  //
  if ( currentSong == 0 ) {
    song = "cocoa - Baby Keem";
  } else if ( currentSong == 1 ) {
    song = "Baby - Dababy, Lil Baby";
  } else if ( currentSong == 2 ) {
    song = "Family Ties - Baby Keem, Kendrick Lamar";
  } else if ( currentSong == 3 ) {
    song = "Feel The Fiyaaaah - Metro Boomin, A$AP Rocky, Takeoff";
  } else if ( currentSong == 4 ) {
    song = "XO Tour Llif3 - Lil Uzi";
  }
  //
  loopMusic();
  //
}//End drawMusic
//
void keyPressedMusic() {
  //Forward Button
  if ( key == 'e' || key == 'E' ) {
    songs[currentSong].skip(5000);
    if ( songs[currentSong].position() >= songs[currentSong].length() - 4999 ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
      if ( currentSong <= songs.length - 2 ) {
        if ( loop == 2 ) {
          songs[currentSong].play();
        } else if ( loop == 3 ) {
          currentSong = currentSong + 1;
          songs[currentSong].rewind();
          songs[currentSong].play();
        }
      } else if ( currentSong == songs.length - 1 ) {
        if ( loop == 2 ) {
          songs[currentSong].play();
        } else if ( loop == 3) {
          currentSong = songs.length - songs.length;
          songs[currentSong].rewind();
          songs[currentSong].play();
        }
      }
    }
  } //End Forward
  //Rewind Button
  if ( key == 'q' || key == 'Q' ) {
    songs[currentSong].skip(-5000);
    if ( songs[currentSong].position() <= 4999 ) {
      if ( currentSong == 0  ) {
        if ( loop == 3 ) {
          songs[currentSong].pause();
          songs[currentSong].rewind();
          currentSong = songs.length - 1;
          songs[currentSong].rewind();
          songs[currentSong].play();
        } else {
          songs[currentSong].play();
        }
      } else {
        if ( loop == 3 ) {
          songs[currentSong].pause();
          songs[currentSong].rewind();
          currentSong = currentSong - 1;
          songs[currentSong].rewind();
          songs[currentSong].play();
        } else {
          songs[currentSong].play();
        }
      }
    }
  } //End Rewind Button
  //
  //Loop 1
  if ( key == '1' ) {
    loop = 1;
  } //End Loop 1
  //Loop 2
  if ( key == '2' ) {
    loop = 2;
  } //End Loop 2
  //Loop 3
  if ( key == '3' ) {
    loop = 3;
  } //End Loop 3
  //
  //Stop Button
  if ( key == 's' || key == 'S') {
    /*
   - Include soft "PAUSE" for first 15 seconds of STOP
     - Include auto previous and next track if STOP at beginning or end of file
     */
    if (songs[currentSong].isPlaying() ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
    } else {
      songs[currentSong].rewind();
    }
  }//End Stop Button
  //
  //Play-Pause Button
  if (key == CODED) {
    if (keyCode == SHIFT) {
      if ( songs[currentSong].isPlaying() ) {
        songs[currentSong].pause();
      } else {
        songs[currentSong].play();
      }
    }
  } //End Play-Pause Button
  //
  //Next Song Button
  if ( key == 'x' || key == 'X' ) {
    if ( currentSong <= songs.length - 2 ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
      currentSong = currentSong + 1;
      songs[currentSong].rewind();
      songs[currentSong].play();
    } else if ( currentSong == songs.length - 1 ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
      currentSong = songs.length - songs.length;
      songs[currentSong].rewind();
      songs[currentSong].play();
    }
  }//End Next Song Button
  //
  //Previous Song Button
  if ( key == 'z' || key == 'Z' ) {
    if ( currentSong == 0  ) {
      if ( songs[currentSong].position() <= 3000 ) {
        songs[currentSong].pause();
        songs[currentSong].rewind();
        currentSong = songs.length - 1;
        songs[currentSong].rewind();
        songs[currentSong].play();
      } else {
        songs[currentSong].rewind();
        songs[currentSong].play();
      }
    } else {
      if ( songs[currentSong].position() <= 3000 ) {
        songs[currentSong].pause();
        songs[currentSong].rewind();
        currentSong = currentSong - 1;
        songs[currentSong].rewind();
        songs[currentSong].play();
      } else {
        songs[currentSong].rewind();
        songs[currentSong].play();
      }
    }
  }//End Previous Song Button
  //
  //Mute Button
  if (key == CODED) {
    if (keyCode == CONTROL) {
      mute();
    }
  }//End Mute Button
  //
  //Quit Button
  if (key == CODED) {
    if (keyCode == ESC) {
      exit();
    }
  }//End Mute Button
} //End keyPressedMusic
//
void mousePressedMusic() {
  if ( mouseX>=pauseX1 && mouseX<=pauseX2+pauseWidth && mouseY>=pauseY1 && mouseY<=pauseY2+pauseHeight ) {
    if ( songs[currentSong].isPlaying() ) {
      songs[currentSong].pause();
    } else {
      songs[currentSong].play();
    }
  }
  if ( mouseX>=prevX2A && mouseX<=prevX1B && mouseY>=prevY3A && mouseY<=prevY1A ) {
    if ( currentSong == 0  ) {
      if ( songs[currentSong].position() <= 3000 ) {
        songs[currentSong].pause();
        songs[currentSong].rewind();
        currentSong = songs.length - 1;
        songs[currentSong].rewind();
        songs[currentSong].play();
      } else {
        songs[currentSong].rewind();
        songs[currentSong].play();
      }
    } else {
      if ( songs[currentSong].position() <= 3000 ) {
        songs[currentSong].pause();
        songs[currentSong].rewind();
        currentSong = currentSong - 1;
        songs[currentSong].rewind();
        songs[currentSong].play();
      } else {
        songs[currentSong].rewind();
        songs[currentSong].play();
      }
    }
  }
  if ( mouseX>=nextX1B && mouseX<=nextX2A && mouseY>=nextY3A && mouseY<=nextY1A ) {
    if ( currentSong <= songs.length - 2 ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
      currentSong = currentSong + 1;
      songs[currentSong].rewind();
      songs[currentSong].play();
    } else if ( currentSong == songs.length - 1 ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
      currentSong = songs.length - songs.length;
      songs[currentSong].rewind();
      songs[currentSong].play();
    }
  }
  if ( mouseX>=unmuteX && mouseX<=unmuteL2X1 && mouseY>=unmuteY3 && mouseY<=unmuteY1 ) {
    mute();
  }
  if ( mouseX>=muteX && mouseX<=muteL1X2 && mouseY>=muteY1 && mouseY<=muteY3 ) {
    mute();
  }
  if ( mouseX>=stopX && mouseX<=stopX+stopWidth && mouseY>=stopY && mouseY<=stopY+stopWidth ) {
    if (songs[currentSong].isPlaying() ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
    } else {
      songs[currentSong].rewind();
    }
  }
  if ( mouseX>=quit1X1 && mouseX<=quit1X2 && mouseY>=quit1Y1 && mouseY<=quit1Y2 ) {
    exit();
  }
  if ( mouseX>=rewindX2A && mouseX<=rewindX1B && mouseY>=textY4 && mouseY<=rewindY3A ) {
    songs[currentSong].skip(-5000);
    if ( songs[currentSong].position() <= 4999 ) {
      if ( currentSong == 0  ) {
        if ( loop == 3 ) {
          songs[currentSong].pause();
          songs[currentSong].rewind();
          currentSong = songs.length - 1;
          songs[currentSong].rewind();
          songs[currentSong].play();
        } else {
          songs[currentSong].play();
        }
      } else {
        if ( loop == 3 ) {
          songs[currentSong].pause();
          songs[currentSong].rewind();
          currentSong = currentSong - 1;
          songs[currentSong].rewind();
          songs[currentSong].play();
        } else {
          songs[currentSong].play();
        }
      }
    }
  }
  if ( mouseX>=forwardX1B && mouseX<=forwardX2A && mouseY>=textY4 && mouseY<=forwardY3A ) {
    songs[currentSong].skip(5000); //parameter in milliseconds
    if ( songs[currentSong].position() >= songs[currentSong].length() - 4999 ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
      if ( currentSong <= songs.length - 2 ) {
        if ( loop == 2 ) {
          songs[currentSong].play();
        } else if ( loop == 3 ) {
          currentSong = currentSong + 1;
          songs[currentSong].rewind();
          songs[currentSong].play();
        }
      } else if ( currentSong == songs.length - 1 ) {
        if ( loop == 2 ) {
          songs[currentSong].play();
        } else if ( loop == 3) {
          currentSong = songs.length - songs.length;
          songs[currentSong].rewind();
          songs[currentSong].play();
        }
      }
    }
  }
} //End mousePressedMusic
//
void mute() {
  if ( songs[currentSong].isMuted() ) {
    songs[currentSong].unmute();
    muted = false;
  } else {
    songs[currentSong].mute();
    muted = true;
  }
}
void loopMusic() {
  if ( loop == 1 ) {
    if ( songs[currentSong].position() == songs[currentSong].length() ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
    }
  } else if ( loop == 2 ) {
    if ( songs[currentSong].position() == songs[currentSong].length() ) {
      songs[currentSong].pause();
      songs[currentSong].rewind();
      songs[currentSong].play();
    }
  } else if ( loop == 3 ) {
  if ( songs[currentSong].position() == songs[currentSong].length() ) {
    songs[currentSong].pause();
    songs[currentSong].rewind();
    currentSong = currentSong + 1;
    songs[currentSong].rewind();
    songs[currentSong].play();
  }
}
}//End loopMusic
//End Music SubProgram
