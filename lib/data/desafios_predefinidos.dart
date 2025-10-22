import '../models/desafio.dart';
import '../models/grafo.dart';

Desafio gerarDesafioCiclo(int nVertices) {
  final g = Grafo(nVertices);
  for (var i = 0; i < nVertices; i++) {
    g.adicionarAresta(i, (i+1)%nVertices);
  }
  g.gerarPosicoesCirculares();
  return Desafio(nome: 'C$nVertices', grafo: g);
}

final desafiosPredefinidos = [

  // S4 + aresta
  ((){
    final g = Grafo(4);

    // Ciclo
    g.definirPosicao(0, 1/4, 6/7);
    g.definirPosicao(1, 3/4, 6/7);
    g.definirPosicao(2, 2/4, 3/7);
    g.definirPosicao(3, 2/4, 1/7);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(2, 3);
    g.adicionarAresta(0, 2);
    //g.adicionarAresta(0, 3);
    //g.adicionarAresta(1, 3);

    return Desafio(nome: 'Nível 1', grafo: g);
  }()),

  // C5
  ((){
    final g = Grafo(5);

    // Ciclo
    g.definirPosicao(0, 3/8, 4/5);
    g.definirPosicao(1, 5/8, 4/5);
    g.definirPosicao(3, 1/2, 1/5);
    g.definirPosicao(4, 2/8, 2/5);
    g.definirPosicao(2, 6/8, 2/5);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(2, 3);
    g.adicionarAresta(3, 4);
    g.adicionarAresta(4, 0);
    //g.adicionarAresta(0, 3);
    //g.adicionarAresta(1, 3);

    return Desafio(nome: 'Nível 2', grafo: g);
  }()),

  // K6 - emparelhamento
  ((){
    final g = Grafo(6);

    // Ciclo -- Esquerda
    g.definirPosicao(0, 1/4, 1/6);
    g.definirPosicao(1, 2/4, 1/4);
    g.definirPosicao(2, 3/4, 1/6);
    g.definirPosicao(3, 3/4, 5/6);
    g.definirPosicao(4, 2/4, 3/4);
    g.definirPosicao(5, 1/4, 5/6);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(0, 2);
    g.adicionarAresta(0, 4);
    g.adicionarAresta(0, 5);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(1, 3);
    g.adicionarAresta(1, 5);
    g.adicionarAresta(2, 3);
    g.adicionarAresta(2, 4);
    g.adicionarAresta(3, 4);
    g.adicionarAresta(3, 5);
    g.adicionarAresta(4, 5);

    return Desafio(nome: 'Nível 3', grafo: g);
  }()),

  // 3-regular com 10 vértices
  ((){
    final g = Grafo(10);

    // Ciclo externo
    g.definirPosicao(0, 1/10, 18/20);
    g.definirPosicao(1, 9/10, 18/20);
    g.definirPosicao(2, 7/10, 1/10);
    g.definirPosicao(3, 1/2, 1/5);
    g.definirPosicao(4, 3/10, 1/10);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(2, 3);
    g.adicionarAresta(3, 4);
    g.adicionarAresta(4, 0);
    g.adicionarAresta(2, 4);

    // Ciclo interno
    g.definirPosicao(5, 2/5, 4/5);
    g.definirPosicao(6, 3/5, 4/5);
    g.definirPosicao(7, 7/10, 1/2);
    g.definirPosicao(8, 1/2, 7/20);
    g.definirPosicao(9, 3/10, 1/2);
    g.adicionarAresta(5, 6);
    g.adicionarAresta(7, 6);
    g.adicionarAresta(7, 8);
    g.adicionarAresta(8, 9);
    g.adicionarAresta(9, 5);

    // Arestas entre os ciclos
    g.adicionarAresta(5, 0);
    g.adicionarAresta(9, 0);
    g.adicionarAresta(6, 1);
    g.adicionarAresta(7, 1);
    g.adicionarAresta(8, 3);

    return Desafio(nome: 'Nível 4', grafo: g);
  }()),

  // 2C5 ligados por aresta
  ((){
    final g = Grafo(10);

    // Ciclo -- Esquerda
    g.definirPosicao(0, 1/7, 2/5);
    g.definirPosicao(1, 1/7, 4/5);
    g.definirPosicao(2, 3/7, 4/5);
    g.definirPosicao(3, 3/7, 2/5);
    g.definirPosicao(4, 2/7, 1/5);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(2, 3);
    g.adicionarAresta(3, 4);
    g.adicionarAresta(4, 0);
    //g.adicionarAresta(0, 2);
    //g.adicionarAresta(1, 3);

    // Ciclo interno
    g.definirPosicao(5, 4/7, 2/5);
    g.definirPosicao(6, 4/7, 4/5);
    g.definirPosicao(7, 6/7, 4/5);
    g.definirPosicao(8, 6/7, 2/5);
    g.definirPosicao(9, 5/7, 1/5);
    g.adicionarAresta(5, 6);
    g.adicionarAresta(7, 6);
    g.adicionarAresta(7, 8);
    g.adicionarAresta(8, 9);
    g.adicionarAresta(9, 5);
    //g.adicionarAresta(5, 7);
    //g.adicionarAresta(6, 8);

    // Arestas entre os ciclos
    g.adicionarAresta(4, 9);

    return Desafio(nome: 'Nível 5', grafo: g);
  }()),

  // Casinhas
  ((){
    final g = Grafo(10);

    // Ciclo -- Esquerda
    g.definirPosicao(0, 1/7, 2/5);
    g.definirPosicao(1, 1/7, 4/5);
    g.definirPosicao(2, 3/7, 4/5);
    g.definirPosicao(3, 3/7, 2/5);
    g.definirPosicao(4, 2/7, 1/5);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(2, 3);
    g.adicionarAresta(3, 4);
    g.adicionarAresta(4, 0);
    g.adicionarAresta(0, 2);
    g.adicionarAresta(1, 3);

    // Ciclo interno
    g.definirPosicao(5, 4/7, 2/5);
    g.definirPosicao(6, 4/7, 4/5);
    g.definirPosicao(7, 6/7, 4/5);
    g.definirPosicao(8, 6/7, 2/5);
    g.definirPosicao(9, 5/7, 1/5);
    g.adicionarAresta(5, 6);
    g.adicionarAresta(7, 6);
    g.adicionarAresta(7, 8);
    g.adicionarAresta(8, 9);
    g.adicionarAresta(9, 5);
    g.adicionarAresta(5, 7);
    g.adicionarAresta(6, 8);

    // Arestas entre os ciclos
    g.adicionarAresta(4, 9);

    return Desafio(nome: 'Nível 6', grafo: g);
  }()),
  



];
