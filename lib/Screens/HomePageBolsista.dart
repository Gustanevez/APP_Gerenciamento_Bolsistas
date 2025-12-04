import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';
<<<<<<< HEAD
=======
import 'package:gerenciamento_bolsistas/Widgets/Menu2.dart';
>>>>>>> 4b33880fb41e70838992a66e0a7d9935f2e1d6d9

class Homepagebolsista extends StatelessWidget {
  const Homepagebolsista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 32, 191, 85),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Olá,Bolsista",
=======
      drawer: const Menu2(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "Olá, Bolsista!",
>>>>>>> 4b33880fb41e70838992a66e0a7d9935f2e1d6d9
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
<<<<<<< HEAD
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Button(
                    text: 'Notificações',
                    onPressed: () {},
                    size: const Size(335, 46),
                    color: cor1,
                    icon: Image.asset(
                      'assets/image/logo.png',
                      width: 12,
                      height: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 140,
                    width: 337,
                    color: cor1,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: const Text('Metas do projeto'),
                    ),
                  ),
                ],
              ),
            ],
=======
          child: SingleChildScrollView(
            // Para permitir scroll se os cards crescerem
            child: Column(
              children: [
                // --- Botão de Notificações ---
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

                // --- Card de Metas do Projeto ---
                // --- Card de Metas e Prazos do Projeto ---
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
                        'Metas e Prazos do Projeto',
                        style: TextStyle(fontFamily: 'ABeeZee', fontSize: 18),
                      ),

                      const SizedBox(height: 12),

                      // --- ITEM 1 ---
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
                                    style: TextStyle(
                                      fontFamily: 'ABeeZee',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Prazo: 20/11',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
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

                      // Linha divisória
                      Container(
                        height: 1,
                        color: Colors.black26,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                      ),

                      // --- ITEM 2 ---
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
                                    style: TextStyle(
                                      fontFamily: 'ABeeZee',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Prazo: 21/11',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
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

                const SizedBox(height: 20),

                // --- Novo Card de Registro de Presença ---
                _buildRegistrationCard(title: 'Registro de Presença'),

                const SizedBox(height: 20),

                // --- Card de Metas do Projeto ---
                // --- CARD STATUS DE RELATÓRIOS E FREQUÊNCIAS ---
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

                      // -------- ITEM 1 --------
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

                      // -------- ITEM 2 --------
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

                      // -------- ITEM 3 --------
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

                      // -------- ITEM 4 --------
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
>>>>>>> 4b33880fb41e70838992a66e0a7d9935f2e1d6d9
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
=======

  // --- WIDGETS AUXILIARES ---
  // Função auxiliar para criar o Card com campo de texto (Registro de Presença)
  // Função auxiliar para criar o Card de Registro de Presença com campo de input
  Widget _buildRegistrationCard({required String title}) {
    return Container(
      width: 337,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // fundo branco do card
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromARGB(255, 83, 83, 83), // borda preta
          width: 1,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título do card
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'ABeeZee',
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 8),

          // Exemplo do que pode escrever (texto pequeno abaixo do título)
          const Text(
            'Ex.: Data, local e outras observações de presença',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),

          const SizedBox(height: 12),

          // Campo de texto
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Digite aqui...', // exemplo dentro do campo
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 85, 85, 85),
                ), // borda preta
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 88, 88, 88),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 82, 82, 82),
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(8.0),
            ),
            style: const TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required Widget content,
    double topMargin = 0,
  }) {
    return Container(
      width: 337,
      margin: EdgeInsets.only(top: topMargin, bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'ABeeZee',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildStatusItem(String name, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
          ),
          Text(
            status,
            style: TextStyle(
              fontFamily: 'ABeeZee',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
>>>>>>> 4b33880fb41e70838992a66e0a7d9935f2e1d6d9
}
