class Inventory{
  Item cabeca;
  
  public Inventory(){
    this.cabeca = null;
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
     
  }
  
  public void desenha(){
    size(900, 900);
  }
}
