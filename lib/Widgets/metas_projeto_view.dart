import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';

class Metas_views extends StatelessWidget {
  const Metas_views({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 337,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cor1,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Text(
              'Metas e Prazos do Projeto',
              style: TextStyle(fontFamily: 'ABeeZee', fontSize: 18),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/Image/list.png', width: 20),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Concluir Revisão Bibliográfica',
                          style: TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
                        ),
                        Text(
                          'Prazo: 20/11',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              height: 1,
              color: Colors.black26,
              margin: const EdgeInsets.symmetric(vertical: 8),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/Image/list.png', width: 20),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2. Enviar Relatório e Frequência',
                          style: TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
                        ),
                        Text(
                          'Prazo: 21/11',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
