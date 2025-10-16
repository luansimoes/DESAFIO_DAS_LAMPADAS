import 'dart:math';

import 'package:desafio_das_lampadas/models/grafo.dart';
import 'package:flutter/material.dart';
import '../models/desafio.dart';
import '../models/grafo.dart';
import '../widgets/painel_superior.dart';
import '../widgets/lampada_widget.dart';
import '../widgets/aresta_widget.dart';

class JogoScreen extends StatefulWidget {
  final Desafio desafio;

  const JogoScreen({super.key, required this.desafio});

  @override
  State<JogoScreen> createState() => _JogoScreenState();
}

class _JogoScreenState extends State<JogoScreen> {

  late Desafio desafio;

  @override
  void initState() {
    super.initState();
    desafio = widget.desafio;
    desafio.reiniciar();
  }

  /// Exibe um diálogo quando o desafio é concluído
  void _verificarVitoria(BuildContext context) {
    if (desafio.concluido()) {
      Future.delayed(const Duration(milliseconds: 200), () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Parabéns!'),
            content: Text(
              'Você completou o desafio em ${desafio.movimentos} movimentos!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // fecha o diálogo
                  Navigator.of(context).pop(); // volta à tela inicial
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final desafio = widget.desafio;
    final grafo = desafio.grafo;

    final posicoes = grafo.posicoes;

    // calcula os limites do grafo
    final minX = posicoes.map((p) => p.x).reduce((a, b) => a < b ? a : b);
    final maxX = posicoes.map((p) => p.x).reduce((a, b) => a > b ? a : b);
    final minY = posicoes.map((p) => p.y).reduce((a, b) => a < b ? a : b);
    final maxY = posicoes.map((p) => p.y).reduce((a, b) => a > b ? a : b);

    final larguraGrafo = maxX - minX;
    final alturaGrafo = maxY - minY;

    //final larguraTela = MediaQuery.of(context).size.width;
    //final alturaTela = MediaQuery.of(context).size.height;

    //final double offsetX = ((larguraTela*0.5) - larguraGrafo) / 2;
    //final double offsetY = ((alturaTela*0.8) - alturaGrafo) / 2;


    return Scaffold(
      appBar: AppBar(
        title: Text(desafio.nome),
        centerTitle: true,
      ),
      body: Column(
        children: [
          PainelSuperior(
            movimentos: desafio.movimentos,
            onReiniciar: () {
              setState(() {
                desafio.reiniciar();
              });
            },
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final larguraTela = constraints.maxWidth;
                final alturaTela = constraints.maxHeight;

                return SizedBox.expand(
                  child: Stack(
                    children: [
                      // Arestas
                      for (var i = 0; i < grafo.numeroDeVertices; i++)
                        for (var j in grafo.adjacencias[i])
                          if (i < j)
                            ArestaWidget(
                              origem: Ponto(
                                posicoes[i].x * larguraTela,
                                posicoes[i].y * alturaTela,
                              ),
                              destino: Ponto(
                                posicoes[j].x * larguraTela,
                                posicoes[j].y * alturaTela,
                              ),
                            ),

                      // Lâmpadas
                      for (var i = 0; i < grafo.numeroDeVertices; i++)
                        LampadaWidget(
                          indice: i,
                          acesa: grafo.estados[i],
                          escala: 1 / (sqrt(grafo.numeroDeVertices) + 5),
                          tamanhoTela: min(alturaTela, larguraTela),
                          posicao: Ponto(
                            posicoes[i].x * larguraTela,
                            posicoes[i].y * alturaTela,
                          ),
                          onPress: () {
                            setState(() {
                              desafio.jogar(i);
                            });
                            _verificarVitoria(context);
                          },
                        ),
                    ],
                  ),
                );          
              },
            ),
          ),
        ],
      ),
    );
  }
  
}
