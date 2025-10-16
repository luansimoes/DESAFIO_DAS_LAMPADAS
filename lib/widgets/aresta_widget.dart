import 'package:flutter/material.dart';
import '../models/grafo.dart';

class ArestaWidget extends StatelessWidget {
  final Ponto origem;
  final Ponto destino;

  const ArestaWidget({
    super.key,
    required this.origem,
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArestaPainter(origem, destino),
    );
  }
}

class _ArestaPainter extends CustomPainter {
  final Ponto origem;
  final Ponto destino;

  _ArestaPainter(this.origem, this.destino);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    canvas.drawLine(
      Offset(origem.x, origem.y),
      Offset(destino.x, destino.y),
      paint,
    );
  }

  @override
  bool shouldRepaint(_ArestaPainter oldDelegate) => false;
}
