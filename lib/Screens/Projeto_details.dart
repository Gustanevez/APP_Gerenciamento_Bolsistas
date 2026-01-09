import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/projectStateProvider.dart';
import 'package:gerenciamento_bolsistas/Screens/neuro_code_Page.dart';

class ProjetoDetails extends ConsumerWidget {
  const ProjetoDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final projetosAsync = ref.watch(projectProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7FCEB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projetos",
            style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
          ),
          
          const SizedBox(height: 10), 

          
          projetosAsync.when(
            data: (listaDeProjetos) {
              
              
              
              if (listaDeProjetos.isEmpty) {
                return const Text(
                  'Nenhum projeto cadastrado',
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontSize: 16,
                  ),
                );
              }

              
              return Column(
                children: [
                  for (int i = 0; i < listaDeProjetos.length; i++) ...[
                    _ProjetoItem(
                      titulo: "${i + 1}.${listaDeProjetos[i].titulo}",
                      pageDestino: const NeuroCodePage(),
                    ),
                    const SizedBox(height: 12),
                  ]
                ],
              );
            },
            
            
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
            
            
            error: (erro, stack) => Text('Erro ao carregar: $erro'),
          ),
        ],
      ),
    );
  }
}

class _ProjetoItem extends StatelessWidget {
  final String titulo;
  final Widget pageDestino;

  const _ProjetoItem({required this.titulo, required this.pageDestino});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          debugPrint('Clicou no projeto: $titulo');
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => pageDestino));
        },
        child: Container(
          height: 70,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              titulo,
              style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}