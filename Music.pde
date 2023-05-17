//Global Variables
//
Minim minim; //creates an object to access all functions
AudioPlayer[] songs = new AudioPlayer[5]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3;
AudioPlayer[] soundEffects = new AudioPlayer[1];
String pathway, Groove, Sting, Baby, FamilyTies, FeelTheFiyaaaah, XOTourLlif3;
int currentSong=2;
Boolean autoPlayOn=false;
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
  songs[0] = minim.loadFile( pathway + Groove );
  songs[1] = minim.loadFile( pathway + Baby );
  songs[2] = minim.loadFile( pathway + FamilyTies ) ;
  songs[3] = minim.loadFile( pathway + FeelTheFiyaaaah );
  songs[4] = minim.loadFile( pathway + XOTourLlif3 ) ;
  soundEffects[0] = minim.loadFile( path + Sting );
  //
} //End setupMusic
//
void drawMusic() {
  //Debugging in CONSOLE
  println("Current Song Position:", songs[currentSong].position() );
  println( "End Of Song:", songs[currentSong].length() );
  //
  autoPlayMusic();
  //
}//End drawMusic
//
void keyPressedMusic() {
  //
  //Prototyping to copy when works
  if ( key == 'm' || key == 'M' ) {//Mute Button
    mute();
  }
  //
  //Forward
  if ( key == 'e' || key == 'E' ) {
    songs[currentSong].skip(5000); //parameter in milliseconds
  } else if ( songs[currentSong].position() >= songs[currentSong].length() - 5000 ) {
    currentSong = currentSong + 1;
    //Student to finish
    //ERROR Catch: if end of song, then next song
  } //End Forward
  //Rewind Button
  if ( key == 'q' || key == 'Q' ) {
    //Spamming R means start playing at the beginning of the song
    songs[currentSong].skip(-5000); //parameter in milliseconds
  } else if ( songs[currentSong].position() <= 5000 ) {
    currentSong = currentSong - 1;
  } //End Rewind Button
  //
  //Single Loop, starter function
  //if ( key == '1' ) songs[currentSong].loop(1); //ERROR: Immediately restarts song
  if ( key <= '9' && key != '1' ) {
    delay( songs[currentSong].length() - songs[currentSong].position() );
    //ERROR: delay stops all player functions, computer doesn't recognize if song playing
    songs[currentSong].loop(-1);
  } //End Single Loop
  //
  //Stop
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
  }//End Stop
  //
  //Play-Pause
  if ( key == 'p' || key == 'P' ) {
    if ( songs[currentSong].isPlaying() ) {
      songs[currentSong].pause();
    } else if ( songs[currentSong].position() >= songs[currentSong].length()*9/10 ) {
      //Student to finish
      // .pause(), /rewind(), then cue next song
    } else {
      songs[currentSong].play(); //no auto rewind like loop()
    }
  } //End Play-Pause
  //
  //Autoplay Button
  if ( key == 'o' || key == 'O' ) {
    if ( autoPlayOn == false ) {
      autoPlayOn = true;
    } else {
      autoPlayOn = false;
    }
  }//End Autoplay Button
  //
  //Next Song Button
  //BOTE: Needs to be smarter
  if ( key == 'x' || key == 'X' ) {
    if ( songs[currentSong].isPlaying() ) {
      //Empty IF
    } else if ( currentSong == songs.length - 1 ) {//ERROR Catch: ArrayOutOfBounds
      currentSong = songs.length - songs.length;
      songs[currentSong].rewind();
    } else {
      currentSong++;
      songs[currentSong].rewind();
      //THROWS ArrayOutOfBounds Error
    }
  }//End Next Song Button
  //
  //Previous Song Button
  if ( key == 'z' || key == 'Z' ) {
    if ( songs[currentSong].isPlaying() ) {
    } else if ( currentSong == 0  ) {
      currentSong = songs.length - 1;
      songs[currentSong].rewind();
    } else {
      currentSong++;
      songs[currentSong].rewind();
    }
  }//End Previous Song Button
  //
} //End keyPressedMusic
//
void mousePressedMusic() {
} //End mousePressedMusic
//
void concantenationOfMusicFiles() {
  pathway = "data/";
  Groove = "groove.mp3";
  Sting = "The_Simplest_Sting.mp3" ;
  Baby = "Baby.mp3" ;
  FamilyTies = "Family_Ties.mp3" ;
  FeelTheFiyaaaah = "Feel_The_Fiyaaaah.mp3" ;
  XOTourLlif3 = "XO_Tour_Llif3.mp3" ;
} //End concantenation
//
void autoPlayMusic() {
  if ( autoPlayOn ) {//Auto Play
    //if () {} if else () {} else {}
    //Ex#1: /position() >= .length(), then rewind(), currentSong+=1, .play()
    //Ex#2: .isPlaying(), when false rewind(), currentSong+=1, .play
  }
}//End Auto Play Music
//
void mute() {
  //Mute Button
  //ERROR: this MUTE Button only works when the song is playing
  //ERROR Fix: unmute or rewind when song is not playing
  if ( songs[currentSong].isMuted() ) {
    songs[currentSong].unmute();
  } else if ( songs[currentSong].position() >= songs[currentSong].length()*9/10 ) {
    songs[currentSong].rewind();
  } else {
    songs[currentSong].mute();
  }
}//End Mute
//End Music SubProgram
