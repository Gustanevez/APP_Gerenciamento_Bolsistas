import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/metas_state_provider.dart';


class MetasDatails extends ConsumerWidget {
  const MetasDatails({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Olá, Coordenador',
            style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
          ),
        ),
      ),
      body: Column(
        
      ),
    );
  }
  
}