import 'grafo.dart';

/// Representa um desafio do jogo "Desafio das Lâmpadas"
/// Cada desafio possui:
/// - Um nome identificador
/// - Um grafo com vértices e arestas
/// - Um contador de movimentos do jogador
/// - Um estado de conclusão (todas as lâmpadas acesas)
class Desafio {
  /// Nome do desafio (ex: "Fácil 1", "Desafio em triângulo", etc.)
  final String nome;

  /// O grafo correspondente ao desafio
  final Grafo grafo;

  /// Número de movimentos realizados até o momento
  int movimentos = 0;

  /// Construtor: recebe nome e grafo
  Desafio({required this.nome, required this.grafo});

  /// Alterna o vértice [v] e incrementa o contador de movimentos
  void jogar(int v) {
    grafo.alternarVertice(v);
    movimentos++;
  }

  /// Reinicia o desafio (zera movimentos e apaga todas as lâmpadas)
  void reiniciar() {
    movimentos = 0;
    grafo.reiniciar();
  }

  /// Retorna `true` se o desafio foi concluído (todas as lâmpadas acesas)
  bool concluido() {
    return grafo.todasAcesas();
  }

  /// Exibe o estado atual do desafio (útil para testes no console)
  void exibirEstado() {
    print('--- Desafio: $nome ---');
    print('Movimentos: $movimentos');
    grafo.exibirEstados();
    print(concluido() ? '✅ Concluído!' : '⏳ Em andamento...');
  }
}
