import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/project_State_provider.dart';


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
                  // Avisa quem chamou esse widget (se houver função)
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
  // Adicionei controller para você poder salvar os dados depois
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

class TituloMeta extends StatelessWidget { // Renomeei para Padrão CamelCase
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