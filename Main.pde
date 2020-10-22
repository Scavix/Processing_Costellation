int cols = 100;
int rows = cols;
Point[][] arr;
int size;
ArrayList<Point> points;


void setup(){  
  size(1000,1000);
  size = height / rows;
  background(0);
  arr = new Point[cols][rows];
  init();
  aggiungi();
}

void draw(){ 
  //points.add(arr[0][0].find_nearest());
  //points.add(arr[0][0].find_fartest());
  
  /*Disegna in ordine
  for(int i = 1; i<points.size(); i++){
    stroke(255);
    line((points.get(i-1).x+size/2),(points.get(i-1).y+size/2),(points.get(i).x+size/2),(points.get(i).y+size/2));
  }*/
  //Disegna a 2 a 2;
  for(int i = 0; i < points.size(); i++){
    line((points.get(i).x*size+size/2),(points.get(i).y*size+size/2),(points.get(i).find_nearest().x*size+size/2),(points.get(i).find_nearest().y*size+size/2));
  }
}

void init(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      (arr[i][j] = new Point(i,j,int(random(100)))).showMe();
    }
  }
  points = new ArrayList<Point>();
  arr[0][0].isOn=1;
  arr[0][0].showMe();
  points.add(arr[0][0]);
}

void mousePressed() {
  init();
  aggiungi();
}

void aggiungi(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if(arr[i][j].isOn==1){points.add(arr[i][j]);}
    }
  }
}
