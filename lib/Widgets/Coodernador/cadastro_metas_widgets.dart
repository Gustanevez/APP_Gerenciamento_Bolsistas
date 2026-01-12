import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/projectStateProvider.dart';
import 'package:gerenciamento_bolsistas/Models/metas.dart';
import 'package:gerenciamento_bolsistas/Models/metas_state_provider.dart';

class SelecionarProjeto extends ConsumerStatefulWidget {
  final String label;
  final String hint;
  final Function(Project?)? onProjetoSelected; 

  const SelecionarProjeto({
    super.key,
    required this.label,
    this.hint = "",
    this.onProjetoSelected,
  });

  @override
  ConsumerState<SelecionarProjeto> createState() => _SelecionarProjetoState();
}

class _SelecionarProjetoState extends ConsumerState<SelecionarProjeto> {
  Project? _projetoSelecionado; // Variável que guarda a escolha

  @override
  Widget build(BuildContext context) {
    
    final projetosAsync = ref.watch(projectProvider);

    return SizedBox(
      width: double.infinity,
      
      child: projetosAsync.when(
        data: (listaProjetos) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: const TextStyle(
                fontFamily: 'ABeeZee',
                fontSize: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Project>(
                isExpanded: true,
                hint: Text(widget.hint),
                value: _projetoSelecionado,
                
                items: listaProjetos.map((projeto) {
                  return DropdownMenuItem<Project>(
                    value: projeto,
                    child: Text(projeto.titulo),
                  );
                }).toList(),
                onChanged: (novoProjeto) {
                  setState(() {
                    _projetoSelecionado = novoProjeto;
                  });
                  
                  if (widget.onProjetoSelected != null) {
                    widget.onProjetoSelected!(novoProjeto);
                  }
                },
              ),
            ),
          );
        },
        
        loading: () => InputDecorator(
          decoration: InputDecoration(
            labelText: widget.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        // Se der erro
        error: (err, stack) => Text('Erro ao carregar projetos: $err'),
      ),
    );
  }
}


class CampoComIcone extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController? controller; 

  const CampoComIcone({
    super.key,
    required this.label,
    required this.icon,
    this.hint = "",
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(
            fontFamily: 'ABeeZee',
            fontSize: 12,
          ),
          suffixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class TituloMeta extends StatelessWidget { 
  final String label;
  final String hint;
  final TextEditingController? controller;

  const TituloMeta({
    super.key,
    required this.label,
    this.hint = "",
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(
            fontFamily: 'ABeeZee',
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class ListaMetas extends ConsumerWidget {
  const ListaMetas({super.key});
  @override
Widget build(BuildContext context, WidgetRef ref) {
  
  final metasAsync = ref.watch(metasProvider);

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
          "Metas",
          style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),

        metasAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text("Erro ao carregar metas: $err"),
          data: (listaDeMetas) {
            
            if (listaDeMetas.isEmpty) {
              return const Center(child: Text("Nenhuma meta cadastrada."));
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listaDeMetas.length,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                return _MetaItem(
                  numero: "${index + 1}.",
                  meta: listaDeMetas[index],
                );
              },
            );
          },
        ),
      ],
    ),
  );
}
}

class _MetaItem extends ConsumerWidget {
  final String numero;
  final Metas meta;

  const _MetaItem({
    required this.numero,
    required this.meta,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final bool isConcluida = meta.status == 'Concluída';
    final Color corStatus = isConcluida ? Colors.green : Colors.orange;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(numero, style: const TextStyle(fontFamily: 'ABeeZee',)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meta.titulo,
                  style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  "Prazo: ${meta.prazo.day}/${meta.prazo.month}/${meta.prazo.year}",
                  style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      meta.status,
                      style: TextStyle(fontFamily: 'ABeeZee', fontSize: 12, color: corStatus,),
                    ),
                    const SizedBox(width: 6),
                    Icon(isConcluida ? Icons.check_circle : Icons.access_time_filled, color: corStatus, size: 16),
                  ],
                ),
              ],
            ),
          ),
         
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.edit,color:Colors.black54),
                onPressed: () {
                  
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete,color:Colors.black54),
                onPressed: () {
                  
                  ref.read(metasProvider.notifier).removeMetas(meta.id!);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}