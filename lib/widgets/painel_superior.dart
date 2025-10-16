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
      color: Colors.green.shade900,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Movimentos: $movimentos', style: const TextStyle(fontSize: 18, color: Colors.white)),
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
