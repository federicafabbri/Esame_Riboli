int colorr=0;
int colorg=0;
int colorb=0;


void setup(){
  size(400, 400);
 
}

void draw(){
  background();
  
  String shape="circlenumber";
  int size=100/(shape.length());
  for (int i=0; i<shape.length(); i++){

    for (int x=-10; x<4; x++){
      for (int y=0; y<2; y++){
    fill(255,random(255));
    noStroke();
         ellipse(x*size+35+(i*size*4.5),200-(size*2)+y*size+(size+10)*sin(millis()*.01+(i*1)),size,size);
        
      }
    }
  }  
}


void background(){
  
    for (int i=0;i<90;i++){
      for (int b=0;b<90;b++){
        
        stroke(i/1,colorg,i/1);
        fill(i/1,colorg,i/1);
        ellipse(i*5,b*5,4,4);
        
      }
    }
  }


void keyPressed() {
  if(key=='g'){
    colorr=200;
    colorg=255;
    colorb=236;
  }
  if(key=='r'){
    colorr=255;
    colorg=102;
    colorb=102;
  }
  if(key=='a'){
    colorr=206;
    colorg=206;
    colorb=255;
  }
  if(key=='c'){
    colorr=214;
    colorg=255;
    colorb=89;
  }
  if(key=='e'){
    colorr=255;
    colorg=255;
    colorb=236;
  }
  if(key==' '){
    colorr=0;
    colorg=0;
    colorb=0;
  }
 
}
