/* CAUTION, code not finished
 Also see Music SubProgram
 */
//Global Variables
String path = new File("").getAbsolutePath(); //Exported Program
//CAUTION: GitHub must be linked to the C-Drive instead of FS ... This might need a lesson
String directory = "C:/Users/mmercer/Documents/GitHub/Sandbox-App-Engine-Reivew-P3/App_Engine"; //Not Exported
//Reminder: \n is a character escape, so pathway must have forward slashes
//
void setupOS_Level() { //End setupOS_Level
  File anyDirectory = new File(path); //Used when exported
  println ("Exported Directory", anyDirectory);
  File githubDirectory = new File(directory); //Used when prototyping
  File [] FileListAnyDirectory = anyDirectory.listFiles();
  printArray(FileListAnyDirectory);
  println("Items in FileList:", FileListAnyDirectory.length);
  int i = 0;
  for (File file : FileListAnyDirectory) {
    if ( file.isFile() ) {
      if ( file.toString().endsWith(".mp3") ) {
        println("Any Directory is working");
        songs[i] = minim.loadFile( file.getName() ) ;
        i = i + 1;
      }
    }
  }
  File[] FileListGitHubDir = githubDirectory.listFiles();
  if ( songs[0] == null ) {
    printArray(FileListGitHubDir);
    for (File file : FileListGitHubDir) {
      if ( file.isFile() ) {
        if ( file.toString().endsWith(".mp3") ) {
          println("Any Directory is working");
          songs[i] = minim.loadFile( file.getName() ) ;
          i+=1;
        }
      }
    }
  } //Catch when Pathway NULL, not exported
}
