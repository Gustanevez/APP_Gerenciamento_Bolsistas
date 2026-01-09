import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Adicionado
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';
import 'package:gerenciamento_bolsistas/Widgets/Menu.dart';
import 'package:gerenciamento_bolsistas/Widgets/metas_projeto_view.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Screens/registrar_frequencia.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia_state_provider.dart'; // Para formatar a data
import 'package:intl/intl.dart';

class Homepagebolsista extends ConsumerWidget {
  
  const Homepagebolsista({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frequenciasAsync = ref.watch(frequenciaProvider);

    return Scaffold(
      drawer: const Menu(),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Botão Notificações
              Center(
                child: Button(
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
              ),

              const SizedBox(height: 40),
              const Metas_views(),
              const SizedBox(height: 40),

              // Botão Registrar
              Buttonactions(
                text: "Registrar Frequência",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrarFrequencia(),
                    ),
                  );
                },
                size: Size(MediaQuery.of(context).size.width * 0.50, 60),
                color: cor4,
              ),

              const SizedBox(height: 60),

              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cor1,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Minhas Frequências Recentes',
                      style: TextStyle(
                        fontFamily: 'ABeeZee',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    frequenciasAsync.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Text("Erro ao carregar: $err"),
                      data: (lista) {
                        if (lista.isEmpty) {
                          return const Text("Nenhuma frequência registrada.");
                        }

                        // Criando a lista dinâmica
                        return ListView.separated(
                          shrinkWrap:
                              true, 
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: lista.length,
                          separatorBuilder: (context, index) =>
                              const Divider(height: 25, color: Colors.black12),
                          itemBuilder: (context, index) {
                            final freq = lista[index];
                            final dataFormatada = DateFormat(
                              'dd/MM/yyyy',
                            ).format(freq.data);

                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/Image/doc.png', width: 24),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        freq.descricao,
                                        style: const TextStyle(
                                          fontFamily: 'ABeeZee',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Data: $dataFormatada',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

