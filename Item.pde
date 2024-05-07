class Item<T> {
  T elemento;
  Item proximo;
  int valor;
  String nome;
  PImage imagem;
  

  Item(T elemento) {
    this.elemento = elemento;
    this.proximo = null;
  }
  
  void mostra() {
    
  }
}
