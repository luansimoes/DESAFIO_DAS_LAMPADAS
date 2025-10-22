import 'dart:math';

import 'package:desafio_das_lampadas/models/grafo.dart';
import 'package:flutter/material.dart';
import '../models/desafio.dart';
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
  int? ultimaLampadaClicada;

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


    return Scaffold(
      appBar: AppBar(
        title: Text(desafio.nome, style: TextStyle(color:Colors.green.shade900, fontWeight: FontWeight.bold),),
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
                          destaque: i == ultimaLampadaClicada,
                          escala: 1 / (sqrt(grafo.numeroDeVertices) + 5),
                          tamanhoTela: min(alturaTela, larguraTela),
                          posicao: Ponto(
                            posicoes[i].x * larguraTela,
                            posicoes[i].y * alturaTela,
                          ),
                          onPress: () {
                            setState(() {
                              ultimaLampadaClicada = i;
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
