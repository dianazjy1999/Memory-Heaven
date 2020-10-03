import processing.video.*;
int numPixels;
int[] backgroundPixels;
Capture video;
PImage img;

void setup() {
  size(640, 480); 
  video = new Capture(this, width, height);
  video.start();
  numPixels = video.width * video.height;
  backgroundPixels = new int[numPixels];
  img = new PImage(video.width, video.height);//make a copy of video.
  frameRate(30);
}

void draw() {
  if (video.available()) {
    video.read();
  }
  img = video;//use img as a template
  img.loadPixels();
  for (int i = 0; i < numPixels; i++) {
    color currColor = img.pixels[i];
    color bkgdColor = backgroundPixels[i];
    int currR = (currColor >> 16) & 0xFF;
    int currG = (currColor >> 8) & 0xFF;
    int currB = currColor & 0xFF;
    int bkgdR = (bkgdColor >> 16) & 0xFF;
    int bkgdG = (bkgdColor >> 8) & 0xFF;
    int bkgdB = bkgdColor & 0xFF;
    int diffR = abs(currR - bkgdR);
    int diffG = abs(currG - bkgdG);
    int diffB = abs(currB - bkgdB);
    int td = 20;//set threshold to 20 pixcels;
    
    //check each pixel of the frame, set background pixels to white.
    if (diffR >td||diffG>td||diffB>td) {
      img.pixels[i] = color(currR, currG, currB);
    } else {
      img.pixels[i] = color(0, 0, 0, 0);
    }
  }
  img.updatePixels();
  //use mouse to adjust the blur effect;
  fastblur(img,(int)map(mouseX,0,width,1,20));
  //display image.
  image(img, 0, 0);
}

void keyPressed() {
  if (key == ' ') {
    //arraycopy(img.pixels, backgroundPixels);
    save("D://Processing Projects//")
  }
}
