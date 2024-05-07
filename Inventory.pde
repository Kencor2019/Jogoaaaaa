class Inventory<T>
{
  int[][] grid;
  int n;
  Item<T> cabeca;
  
  public Inventory()
  {
    n = 1000;
  }
  
  void setup(){
    grid = criaGrid();
  }
  
  void draw()
  {
    background(#044828);
    mostraGrid();
  }
  
  int[][] criaGrid(){
    int[][] m = new int[n][n];
    
    for(int i = 0; i < n; i++){
      for(int j = 0; j < n; j++){
        m[i][j] = (random(1) > 0.8)? 1 : 0;
      }
    }
    return m;
  }

  void mostraGrid(){
    float l = width/(float)n;
    float h = height/(float)n;
    
    for(int i = 0; i < n; i++){
      for(int j = 0; j < n; j++){
        stroke(200);
        fill(grid[i][j] == 0 ? 255 : 0);
        rect(j*l, i*h, l, h);
      }
    }
    
  }
  
  void atualizaGrid(){
    int[][] novoGrid = new int[n][n];
    
    for(int i = 0; i < n; i++){
      for(int j = 0; j < n; j++){
        //vou colocar as imagens ao longo do jogo
      }
    }
    
    grid = novoGrid;
  }
  

  void add(T elemento) {
    Item<T> novoItem = new Item<T>(elemento);
    if (cabeca == null) {
      cabeca = novoItem;
    } else {
      Item<T> fim = cabeca;
      while (fim.proximo != null) {
        fim = fim.proximo;
      }
      fim.proximo = novoItem;
    }
  }
}
