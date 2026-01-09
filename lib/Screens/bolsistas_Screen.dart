import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista_state_provider.dart';
import 'package:gerenciamento_bolsistas/Screens/cadastrar_bolsista.dart';
import 'package:gerenciamento_bolsistas/Models/projectStateProvider.dart';


class BolsistasScreen extends ConsumerWidget {
  const BolsistasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuta o provider de bolsistas (Stream real do Firebase)
    final bolsistasAsync = ref.watch(bolsistaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bolsistas", style: TextStyle(fontFamily: 'ABeeZee')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Filtrar por nome...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9ED99D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroBolsistaScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "+ Bolsista",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              bolsistasAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text("Erro ao carregar: $err")),
                data: (listaBolsistas) {
                  if (listaBolsistas.isEmpty) {
                    return const Center(child: Text("Nenhum bolsista cadastrado."));
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(const Color(0xFFBEE8B3)),
                      columns: const [
                        DataColumn(label: Text('Nome')),
                        DataColumn(label: Text('E-mail')),
                        DataColumn(label: Text('Projeto')),
                        DataColumn(label: Text('Excluir Aluno')),
                      ],
                      rows: List<DataRow>.generate(listaBolsistas.length, (index) {
                        final bolsista = listaBolsistas[index];
                        return DataRow(
                          color: WidgetStateProperty.all(
                            index.isEven ? const Color(0xFFDFF7E3) : Colors.white,
                          ),
                          cells: [
                          DataCell(Text(bolsista.nome)),
                          DataCell(Text(bolsista.email)),
                          DataCell(Consumer(
                              builder: (context, ref, _) {
                                  final projetosAsync = ref.watch(projectProvider);
                                  
                                  return projetosAsync.when(
                                    data: (projetos) {
                                      final String nomeExibir = projetos
                                          .where((p) => p.id == bolsista.projetoId)
                                          .map((p) => p.titulo)
                                          .firstWhere((titulo) => true, orElse: () => "Projeto não encontrado");

                                      return Text(
                                        nomeExibir,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold, 
                                          color: Colors.blueGrey,
                                          fontFamily: 'ABeeZee',
                                        ),
                                      );
                                    },
                                    loading: () => const SizedBox(
                                      width: 20, 
                                      height: 20, 
                                      child: CircularProgressIndicator(strokeWidth: 2)
                                    ),
                                    error: (_, __) => const Text("Erro ao buscar"),
                                  );
                                },
                              )),

                            DataCell(
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.redAccent, size: 20),
                                onPressed: () {
                                  ref.read(bolsistaProvider.notifier).removeBolsista(bolsista.id!);
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}