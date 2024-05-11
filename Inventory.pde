class Inventory {
    Item cabeca;
    PImage fundo, vent, despause;
    public int score, restante, tempoDecorrido, soma, tempoAoPausar;
    int x, y1, y2;
    public int[] quant, q, quant2;
    int[] x2, y3;

    Inventory(PImage fundo, PImage vent, int restante, int score, int tempoDecorrido, int soma) {
        this.despause = loadImage("despause.png");
        this.cabeca = null;
        this.fundo = fundo;
        this.vent = vent;
        this.tempoDecorrido = tempoDecorrido;
        this.restante = restante;
        this.score = score;
        this.soma = soma;
        this.y1 = 420;
        this.y2 = 500;
        this.x = 255;
        this.quant = new int[10];
        this.x2 = new int[10];
        this.y3 = new int[10];
        this.q = new int[10];
        for (int i = 0; i < 10; i++) {
            this.q[i] = 0;
        }
        this.quant2 = new int[10];
        for (int i = 0; i < 10; i++) {
            this.quant2[i] = 0;
        }
    }

    void add(int valor) {
        Item novoItem = new Item(valor);
        if (cabeca == null) {
            cabeca = novoItem;
        } else {
            Item aux = cabeca;
            while (aux.proximo != null) {
                aux = aux.proximo;
            }
            aux.proximo = novoItem;
        }
        q[valor - 1]++;
    }

    int mostra() {
        // Desenha o fundo e outros elementos gráficos
        image(fundo, 0, 0, 900, 900);
        image(vent, 280, 10, 300, 400);
        textSize(90);
        fill(255);
        stroke(255, 0, 0);
        text("IN", 375, 330);
        text("ORY", 633, 330);

        // Desenha o painel
        fill(0);
        stroke(255);
        for (int i = 0; i < 5; i++) {
            rect(x + (80 * i), y2, 80, 80);
            rect(x + (80 * i), y1, 80, 80);
        }

        // Desenha o tempo decorrido e o score
        fill(255);
        rect(5, 44, 31, 31);
        image(despause, 6, 45, 30, 30);

        textAlign(LEFT);
        textSize(20);
        fill(255, 255, 255);
        rect(5, 10, 105, 30);
        fill(0);
        text("Tempo: " + restante, 10, 30);

        textAlign(RIGHT);
        fill(255, 255, 255);
        rect( width - 105, 10, 100, 30);
        fill(0);
        text("Score: " + score, width - 10, 30);

        tempoAoPausar = millis() - tempoDecorrido + soma;

        
        lista();
        return tempoAoPausar;
    }

    void lista() {
        Item atual = cabeca;
        int posicaoX = x + 2;
        int posicaoY = y1 +2;
       
        while (atual != null) {
          
            desenha(atual.retornaImg(), posicaoX, posicaoY, atual);
            
            if(quant2[atual.valor - 1] == 1){
              posicaoX += 80;
              if (posicaoX >= x + 5 * 80) {
                  posicaoX = x + 2;
                  posicaoY = y2 + 2;
              }
            }
            atual = atual.proximo;
        }
    }

    void desenha(PImage imgItem, int x, int y, Item atual) {
        
        quant2[atual.valor - 1]++;
        println(quant2[atual.valor - 1]);
        
        if(quant2[atual.valor - 1] == 1){
          
        
          image(imgItem, x, y, 70, 70);
          x2[atual.valor - 1] = x;
          y3[atual.valor -1] = y;
        }else{
          image(imgItem, x2[atual.valor - 1], y3[atual.valor -1], 70, 70);
        }
        if(y3[atual.valor -1] == 502){
          if(mouseX >= x2[atual.valor - 1] && mouseX <= x2[atual.valor - 1] + 70 && mouseY>= y3[atual.valor -1]  && mouseY <= 70 + y3[atual.valor -1]){
            fill(0);
            stroke(255);
            rect(x2[atual.valor - 1], y3[atual.valor -1] + 90, 75, 30);
            fill(255);
            textSize(10);
            text("VALOR: " + atual.valor, x2[atual.valor - 1] + 45, y3[atual.valor -1] + 105);
            text("QUANTIDADE: " + q[atual.valor - 1], x2[atual.valor - 1] + 73, y3[atual.valor -1] + 115);
          }
        }else{
          if(mouseX >= x2[atual.valor - 1] && mouseX <= x2[atual.valor - 1] + 70 && mouseY>= y3[atual.valor -1]  && mouseY <= 70 + y3[atual.valor -1]){
            fill(0);
            stroke(255);
            rect(x2[atual.valor - 1], y3[atual.valor -1] - 40, 75, 30);
            fill(255);
            textSize(10);
            text("VALOR: " + atual.valor, x2[atual.valor - 1] + 45, y3[atual.valor -1] - 25);
            text("QUANTIDADE: " + q[atual.valor - 1], x2[atual.valor - 1] + 73, y3[atual.valor -1] - 15);
          }
        }
        
    }
}
