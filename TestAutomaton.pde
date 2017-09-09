int black=30;
color[] buffer;
int strength(color c){
  return int(abs(brightness(c)-127.5));
}
void update(){
  buffer=pixels;
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      int i=width*y+x;
      switch(int(random(4))){
        case 0:
          if(x+1>=width)
            break;
          if(strength(buffer[i])>=strength(buffer[i+1]))
            pixels[i+1]=pixels[i];
          break;
        case 1:
          if(x-1<0)
            break;
          if(strength(buffer[i])>=strength(buffer[i-1]))
            pixels[i-1]=pixels[i];
          break;
        case 2:
          if(y+1>=height)
            break;
          if(strength(buffer[i])>=strength(buffer[i+width]))
           pixels[i+width]=pixels[i];
          break;
        case 3:
          if(y-1<0)
            break;
          if(strength(buffer[i])>=strength(buffer[i-width]))
            pixels[i-width]=pixels[i];
      }
    }
  }
  updatePixels();
}
void mousePressed(){
  black=mouseY;
}
void keyPressed(){
  if(key=='r')
    setup();
}
void settings(){
  size(600,600);
}
void setup(){
  background(0);
  loadPixels();
  for(int i=black*width;i<width*height;i++)
      pixels[i]=color(random(256),random(256),random(256));
  updatePixels();
  buffer=pixels;
}
void draw(){
  update();
}