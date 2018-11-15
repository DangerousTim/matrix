class textMatrix { //<>//
  char[][] matrix;
  int tSize = 10;
  int wid = int(width/tSize);
  int hgt = int(height/tSize);

  textMatrix() {
    //generate matrix
    matrix = new char[wid][hgt];

    for (int i = 0; i < hgt; i++) {
      for (int j = 0; j < wid; j++) {
        //create a random character
        char c = char(int(random(65, 123)));
        matrix[j][i] = c;
      }
    }
  }
  void randomChange(int cases) {
    for (int i = 0; i < cases; i++) {
      int x = (int) random(0, wid);
      int y = (int) random(0, hgt);
      matrix[x][y] = char(int(random(65, 123)));
    }
  }
  void dispTrail(Trail trail) {
    //get 2D indices
    int i = int(trail.posx / tSize);
    int j = int(trail.posy / tSize);

    //get actual coordinates for displaying text
    int ax = i * tSize;
    int ay = j * tSize;

    textSize(tSize);
    colorMode(HSB, 360, 100, 100);

    for (int p = 0; p < trail.len; p++) {
      int yind = constrain(j-p, 0, hgt-1);
      //first letter must be white
      if (p == 0){
        fill(0, 0, 100);
      } else {
        //subsqequent letters have decreasing brightness
        fill (120, 100, map(p, 1, trail.len, 100, 0));
      }
      //print text on screen
      text(matrix[i][yind], ax, ay - p*tSize);
    }
  }

  void dPrint() {
    //print contents into debug window
    for (int i = 0; i < hgt; i++) {
      for (int j = 0; j < wid; j++) {
        print(matrix[j][i]);
        print(' ');
      }
      println("");
    }
  }
}
