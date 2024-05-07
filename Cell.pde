class Cell {
  String tipoDaCelula;
  float x, y;
  PImage img;
  int adm;
  
  Cell (String tipoDaCelula, float x, float y, PImage img, int adm){
    this.tipoDaCelula = tipoDaCelula;
    this.x = x;
    this.y = y;
    this.img = img;
    this.adm = adm;
  }
  
  void setTipoDaCelula(String tipoDaCelula, PImage img) {
    this.tipoDaCelula = tipoDaCelula;
    this.img = img;
  }
  
  void display(){
    if (tipoDaCelula.equals("item")) {
      fill(255, 255, 0); // amarelo para item
      rect(x, y, 30, 30); // desenha um retângulo para o item
    } else {
      image(img, x, y, 30*adm, 30*adm);
    }
  }
}
