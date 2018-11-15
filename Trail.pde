class Trail {
  float posx, posy;
  float speed;
  int len;

  Trail(float nposx, float nposy) {
    posx = nposx;
    posy = nposy;
    speed = random(2, 4);
    println(maxTrailLength);
    len = (int) map(speed, 2, 4, maxTrailLength/2, maxTrailLength);
  }
  void update() {
    posy += speed;
  }
  boolean hasExited(textMatrix textmatrix){
    if (posy - len*textmatrix.tSize > height){
      return true;
    } else {
      return false;
    }
  }
}
