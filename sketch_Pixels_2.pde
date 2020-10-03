PImage photo;
int gs = 120;
int gridWidth = gs;
int gridHeight = gs;
color c;


void setup(){
photo = loadImage("1.png");
size(500,300);
background(255);
noStroke();

}


void draw(){
  for(int i = 0;i<photo.width/gridWidth;i++){
    for(int j = 0;j<photo.height/gridHeight;j++){
      //int p = int(random(gridHeight));
      c = photo.pixels[i*gridWidth+j*gridHeight*photo.width];
      fill(c);
      rect(i*gridWidth,j*gridHeight,(i+1)*gridWidth,(j+1)*gridHeight);
    }
  }
}
