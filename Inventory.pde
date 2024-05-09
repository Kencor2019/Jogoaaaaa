class Inventory{
  Item cabeca;
  PImage fundo, vent;
  
  public Inventory(PImage fundo, PImage vent){
    this.cabeca = null;
    this.fundo = fundo;
    this.vent = vent;
  }
  
  public void add(int valor){
    Item novoItem = new Item(valor);
    if(cabeca == null){
     cabeca = novoItem; 
    } else {
      Item aux = cabeca;
      while(aux.proximo != null){
        aux = aux.proximo;
      }
      aux.proximo = novoItem;
    }
  }
  
  public void mostra(){
    //fundo
     size(900, 900);
     image(fundo, 0, 0, 900, 900);
     
    //título
     image(vent, 250, 10, 300, 400);
     textSize(90);
     fill(255);
     text("IN", 350, 330);
     text("ÁRIO", 640, 330);
     
     //painel
     fill(0);
     stroke(255);
     //primeira
     rect(255, 500, 80, 80);
     rect(335, 500, 80, 80);
     rect(415, 500, 80, 80);
     rect(495, 500, 80, 80);
     rect(575, 500, 80, 80);
     //segunda
     rect(255, 420, 80, 80);
     rect(335, 420, 80, 80);
     rect(415, 420, 80, 80);
     rect(495, 420, 80, 80);
     rect(575, 420, 80, 80);
  }
  
  public void desenha(){
    

  }
}
