textMatrix textmatrix;
Trail[] trails;
int numtrails;
int maxTrailLength;

/*
1. longer trails  DONE
2. more ranges of speed  DONE
3. looks v empty  add double amt of trails?
4. changing colour  DONE
5. random  DONE
6. adjust max trail length according to window height DONE
7. Customizibility?
*/
void setup(){
  size(640, 640);
  textmatrix = new textMatrix();
 
  //calc max trail length
  maxTrailLength = (int) map(height, 300, 900, 20, 70);
  
  //calc number of trails
  numtrails = width / textmatrix.tSize;
  trails = new Trail[numtrails];
  
  //initialize  all trails
  for (int i = 0; i < numtrails; i++){
    trails[i] = new Trail(i*textmatrix.tSize, random(-2*height, 0));
  }
}

void draw(){
  background(0);

  //display each trail
  for (int i = 0; i < numtrails; i++){
    if (trails[i].hasExited(textmatrix)){
      trails[i] = new Trail(trails[i].posx, random(-height, 0));
    }
    textmatrix.dispTrail(trails[i]);
    trails[i].update();
  }
  textmatrix.randomChange(30);
}
