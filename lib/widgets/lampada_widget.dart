import 'package:flutter/material.dart';
import '../models/grafo.dart';

class LampadaWidget extends StatelessWidget {
  final int indice;
  final double escala;
  final double tamanhoTela;
  final bool acesa;
  final Ponto posicao;
  final VoidCallback onPress;

  const LampadaWidget({
    super.key,
    required this.indice,
    required this.acesa,
    required this.posicao,
    required this.onPress,
    required this.escala,
    required this.tamanhoTela
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: posicao.x - (escala*tamanhoTela)/2,
      top: posicao.y - (escala*tamanhoTela)/2.5,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          children: [
            Icon(
              //acesa ? Icons.lightbulb : Icons.lightbulb_outline,
              Icons.lightbulb,
              color: acesa ? Colors.amber : const Color.fromARGB(255, 7, 41, 12),
              shadows: [Shadow(
                color: const Color.fromARGB(255, 7, 41, 12),
                blurRadius: 10,
              )],
              size: escala * tamanhoTela,
            ),
            //Text('L$indice'),
          ],
        ),
      ),
    );
  }
}
