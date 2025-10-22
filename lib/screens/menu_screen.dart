import 'package:flutter/material.dart';
import '../data/desafios_predefinidos.dart';
import '../screens/jogo_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final desafios = desafiosPredefinidos;

    return Scaffold(
      appBar: AppBar(
        title: Text('Desafio das Lâmpadas', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.green.shade900),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: 
            ListView.builder(
              itemCount: desafios.length,
              itemBuilder: (context, index) {
                final desafio = desafios[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(desafio.nome, style: TextStyle(color: Colors.green.shade900)),
                    trailing: Icon(Icons.play_arrow, color: Colors.green.shade900,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JogoScreen(desafio: desafio),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                'assets/images/logomaratona.png',
                width: MediaQuery.of(context).size.width * 0.35, // 50% da largura da tela
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      )  
    );
  }
}
