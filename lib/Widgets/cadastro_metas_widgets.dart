import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/metas.dart';
import 'package:gerenciamento_bolsistas/Models/metas_state_provider.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/project_State_provider.dart';
import 'package:gerenciamento_bolsistas/Screens/metas_datails.dart';

class selecionar_projeto extends ConsumerWidget {
  final String label;
  final String hint;

  const selecionar_projeto({
    super.key,
    required this.label,
    this.hint = "",

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projetos = ref.watch(projectProvider);
    Project? projetoSelecionado;

    return StatefulBuilder(
      builder:(context,setState){
      return SizedBox(
      width: double.infinity,
      child: InputDecorator(
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<Project>(
            isExpanded: true,
            value: projetoSelecionado, // ocupa toda a largura
            items: projetos.map((projeto) {
              return DropdownMenuItem<Project>(
                value: projeto,
                child: Text(projeto.titulo),
              );
            }).toList(),
            onChanged: (novoProjeto) {
              if (novoProjeto != null) {
                setState((){
                  projetoSelecionado = novoProjeto;
                }
                );
              }
            },
          ),
        ),
      ),
    );
    }
  );  
  }
}

class CampoComIcone extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;

  const CampoComIcone({
    super.key,
    required this.label,
    required this.icon,
    this.hint = "",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
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

class titulo_meta extends StatelessWidget {
  final String label;
  final String hint;

  const titulo_meta({
    super.key,
    required this.label,
    this.hint = "",

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      
      child: TextField(
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
