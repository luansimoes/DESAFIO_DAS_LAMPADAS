import '../models/desafio.dart';
import '../models/grafo.dart';

final desafiosPredefinidos = [
  (() {
    final g = Grafo(3);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(0, 2);
    g.gerarPosicoesCirculares();
    return Desafio(nome: 'Triângulo', grafo: g);
  })(),
  (() {
    final g = Grafo(4);
    g.adicionarAresta(0, 1);
    g.adicionarAresta(1, 2);
    g.adicionarAresta(2, 3);
    g.adicionarAresta(3, 0);
    g.gerarPosicoesCirculares();
    return Desafio(nome: 'Quadrado', grafo: g);
  })(),
];
