import 'dart:math';

/// Representa um ponto bidimensional (posição na tela)
class Ponto {
  final double x;
  final double y;

  const Ponto(this.x, this.y);

  @override
  String toString() => '($x, $y)';
}

/// Representa um grafo simples, não direcionado,
/// onde cada vértice é uma "lâmpada" com estado ligado/desligado.
class Grafo {
  /// Número total de vértices
  final int numeroDeVertices;

  /// Estados de cada vértice (true = aceso, false = apagado)
  late List<bool> estados;

  /// Lista de adjacência: para cada vértice, a lista de vizinhos
  late List<List<int>> adjacencias;

  /// Posições de cada vértice na tela
  late List<Ponto> posicoes;

  /// Construtor: cria o grafo com vértices apagados e sem arestas
  Grafo(this.numeroDeVertices) {
    estados = List<bool>.filled(numeroDeVertices, false);
    adjacencias = List.generate(numeroDeVertices, (_) => []);
    posicoes = List<Ponto>.filled(numeroDeVertices, const Ponto(0, 0));
  }

  /// Define a posição de um vértice [v] nas coordenadas (x, y)
  void definirPosicao(int v, double x, double y) {
    if (v < 0 || v >= numeroDeVertices) {
      throw ArgumentError('Índice de vértice inválido: $v');
    }
    posicoes[v] = Ponto(x, y);
  }

  /// Adiciona uma aresta não-direcionada entre [u] e [v]
  void adicionarAresta(int u, int v) {
    if (u < 0 || v < 0 || u >= numeroDeVertices || v >= numeroDeVertices) {
      throw ArgumentError('Índices de vértices inválidos: ($u, $v)');
    }

    if (!adjacencias[u].contains(v)) adjacencias[u].add(v);
    if (!adjacencias[v].contains(u)) adjacencias[v].add(u);
  }

  /// Alterna o estado do vértice [v] e de todos os seus vizinhos
  void alternarVertice(int v) {
    if (v < 0 || v >= numeroDeVertices) {
      throw ArgumentError('Índice de vértice inválido: $v');
    }

    // Alterna o vértice clicado
    estados[v] = !estados[v];

    // Alterna os vizinhos
    for (var vizinho in adjacencias[v]) {
      estados[vizinho] = !estados[vizinho];
    }
  }

  /// Reinicia todos os vértices para o estado "apagado"
  void reiniciar() {
    for (var i = 0; i < numeroDeVertices; i++) {
      estados[i] = false;
    }
  }

  /// Retorna true se todas as lâmpadas estiverem acesas
  bool todasAcesas() {
    return estados.every((e) => e);
  }

  /// Mostra o estado atual de cada vértice (útil para debug)
  void exibirEstados() {
    for (var i = 0; i < numeroDeVertices; i++) {
      final status = estados[i] ? '💡' : '⚫';
      print('Vértice $i $status em ${posicoes[i]}');
    }
  }

  /// Gera posições automáticas em círculo (opcional)
  /// Útil caso você queira distribuir vértices de forma genérica
  void gerarPosicoesCirculares({
    double centroX = 0.5,
    double centroY = 0.5,
    double raio = 0.3,
  }) {
    posicoes = List.generate(numeroDeVertices, (i) {
      final angulo = (2 * pi * (i+1)) / numeroDeVertices;
      return Ponto(
        centroX + raio * cos(angulo),
        centroY + raio * sin(angulo),
      );
    });
  }
}
