import '../models/desafio.dart';
import '../models/grafo.dart';

Desafio gerarDesafioCiclo(int n_vertices) {
  final g = Grafo(n_vertices);
  for (var i = 0; i < n_vertices; i++) {
    g.adicionarAresta(i, (i+1)%n_vertices);
  }
  g.gerarPosicoesCirculares();
  return Desafio(nome: 'C$n_vertices', grafo: g);
}

final desafiosPredefinidos = [
  gerarDesafioCiclo(3),
  gerarDesafioCiclo(4),
  gerarDesafioCiclo(5),
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

    return Desafio(nome: 'Nível 2', grafo: g);
  }())
];
