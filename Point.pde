class Point{
  int x,y,isOn;
  
  Point(int x, int y, int isOn){
    this.x = x;
    this.y = y;
    if(isOn<1){this.isOn = 1;}
    else{this.isOn = 0;}
  }
  
  Point(int x, int y){
    this.x = x;
    this.y = y;
    this.isOn = 0;
  }
  
  void showMe(){
    stroke(255);
    fill(255);
    if(this.isOn==1){circle(x*size+size/2,y*size+size/2,10);}
  }
  
  Point find_nearest(){
    int matrix[][] = new int[rows][cols];
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if(arr[i][j].isOn==1){matrix[i][j]=dist(this.x,this.y,i,j);}
        else{matrix[i][j]=rows*cols;}
      }
    }
    matrix[this.x][this.y]=rows*cols;
    return min_point(matrix);
  }
  
  int dist(int thisx,int thisy,int thatx,int thaty){
    return int(sqrt((thisx-thatx)*(thisx-thatx)+(thisy-thaty)*(thisy-thaty)));
  }
  
  Point min_point(int matrix[][]){
    int result = rows*cols;
    int inti=0,intj=0;
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if(matrix[i][j]<result){
          result=matrix[i][j];
          inti=i;intj=j;
        }
      }
    }
    return arr[inti][intj];
  }
  
  Point find_fartest(){
    int matrix[][] = new int[rows][cols];
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if(arr[i][j].isOn==1){matrix[i][j]=dist(this.x,this.y,i,j);}
        else{matrix[i][j]=0;}
      }
    }
    matrix[this.x][this.y]=0;
    return max_point(matrix);
  }
  
  Point max_point(int matrix[][]){
    int result = 0;
    int inti=0,intj=0;
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if(matrix[i][j]>result){
          result=matrix[i][j];
          inti=i;intj=j;
        }
      }
    }
    return arr[inti][intj];
  }
}
