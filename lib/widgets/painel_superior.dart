import 'package:flutter/material.dart';

class PainelSuperior extends StatelessWidget {
  final int movimentos;
  final VoidCallback onReiniciar;

  const PainelSuperior({
    super.key,
    required this.movimentos,
    required this.onReiniciar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Movimentos: $movimentos', style: const TextStyle(fontSize: 18)),
          ElevatedButton.icon(
            onPressed: onReiniciar,
            icon: const Icon(Icons.refresh),
            label: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
