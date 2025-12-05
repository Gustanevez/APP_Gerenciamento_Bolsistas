import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';
import 'package:gerenciamento_bolsistas/Widgets/Menu2.dart';
import 'package:gerenciamento_bolsistas/Widgets/_builder.dart';
import 'package:gerenciamento_bolsistas/Widgets/metas_projeto_view.dart';

class Homepagebolsista extends StatelessWidget {
  const Homepagebolsista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu2(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Olá, Bolsista!",
              style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Button(
                      text: 'Notificações',
                      onPressed: () {},
                      size: Size(MediaQuery.of(context).size.width * 0.9, 46),
                      color: cor1,
                      icon: Image.asset(
                        'assets/Image/notificacao.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                SizedBox(
                    width: 337,
                    
                  child: Metas_views(),
                ),

                const SizedBox(height: 20),

                RegistrationCard(title: 'Registro de Presença'),

                const SizedBox(height: 20),

                Container(
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
                        'Status de Relatórios e Frequências',
                        style: TextStyle(fontFamily: 'ABeeZee', fontSize: 18),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/Image/doc.png', width: 24),
                          const SizedBox(width: 10),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Relatório e Frequência - Setembro',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Status: Aprovado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Container(height: 1, color: Colors.black26),

                      const SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/Image/doc.png', width: 24),
                          const SizedBox(width: 10),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Relatório e Frequência - Agosto',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Status: Pendente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                
                      const SizedBox(height: 12),

                      Container(height: 1, color: Colors.black26),

                      const SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/Image/doc.png', width: 24),
                          const SizedBox(width: 10),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Relatório I',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Status: Pendente',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Container(height: 1, color: Colors.black26),

                      const SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/Image/doc.png', width: 24),
                          const SizedBox(width: 10),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Frequência II',
                                  style: TextStyle(
                                    fontFamily: 'ABeeZee',
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Status: Não aprovado',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
