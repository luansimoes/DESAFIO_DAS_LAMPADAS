import 'package:flutter/material.dart';
import '../models/grafo.dart';

class LampadaWidget extends StatefulWidget {
  final int indice;
  final double escala;
  final double tamanhoTela;
  final bool acesa;
  final bool destaque;
  final Ponto posicao;
  final VoidCallback onPress;

  const LampadaWidget({
    super.key,
    required this.indice,
    required this.acesa,
    required this.destaque,
    required this.posicao,
    required this.onPress,
    required this.escala,
    required this.tamanhoTela
  });

  @override
  State<LampadaWidget> createState() => _LampadaWidgetState();
}

class _LampadaWidgetState extends State<LampadaWidget> {
  bool _primeiraVez = true;

  @override
  void didUpdateWidget(covariant LampadaWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Depois do primeiro update, podemos animar normalmente
    if (_primeiraVez && !oldWidget.acesa && widget.acesa) _primeiraVez = false;
  }



  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.posicao.x - (widget.escala*widget.tamanhoTela)/2,
      top: widget.posicao.y - (widget.escala*widget.tamanhoTela)/2.5,
      child: GestureDetector(
        onTap: widget.onPress,
        child: _primeiraVez?

          Icon(
                //acesa ? Icons.lightbulb : Icons.lightbulb_outline,
                Icons.lightbulb,
                color: const Color.fromARGB(255, 7, 41, 12),
                size: widget.escala * widget.tamanhoTela,
            )
          :
          TweenAnimationBuilder(
          tween: Tween<double>(begin: widget.acesa? 0.0 : 1.0, end: widget.acesa? 1.0 : 0.0), 
          duration: const Duration(milliseconds: 400), 
          curve: Curves.easeInOut,
          builder: (context, valorAnimado, _){
            final escalaAnimada = widget.destaque
              ? 1.0 + 0.15 * (1 - (valorAnimado - 0.5).abs() * 2)
              : 1.0;
            final cor = Color.lerp(
              const Color.fromARGB(255, 7, 41, 12), 
              Colors.amber, 
              valorAnimado
            )!;

            return Transform.scale(
              scale: escalaAnimada,
              alignment: Alignment.center,
              child : 
                Icon(
                  //acesa ? Icons.lightbulb : Icons.lightbulb_outline,
                  Icons.lightbulb,
                  color: cor,
                  shadows: [Shadow(
                    color: const Color.fromARGB(255, 7, 41, 12),
                    blurRadius: 20*valorAnimado,
                  )],
                  size: widget.escala * widget.tamanhoTela,
                ),
            );
          })
      ),
    );
  }
}
