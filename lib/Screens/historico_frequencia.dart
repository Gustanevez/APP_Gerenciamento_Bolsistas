import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia_state_provider.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia.dart';
import 'package:gerenciamento_bolsistas/Screens/registrar_frequencia.dart'; 
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:intl/intl.dart';

class HistoricoFrequenciaScreen extends ConsumerWidget {
  const HistoricoFrequenciaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frequenciasAsync = ref.watch(frequenciaProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Histórico de Registros", 
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: frequenciasAsync.when(
        data: (lista) {
          if (lista.isEmpty) {
            return const Center(child: Text("Nenhum registro encontrado."));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: lista.length,
            itemBuilder: (context, index) {
              final freq = lista[index];
              return _buildCardHistorico(context, freq);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text("Erro ao carregar: $e")),
      ),
    );
  }

  Widget _buildCardHistorico(BuildContext context, Frequencia freq) {
    String dataFormatada = DateFormat('dd/MM/yyyy').format(freq.data);
    
   
    final hoje = DateTime.now();
    final bool ehHoje = freq.data.day == hoje.day && 
                       freq.data.month == hoje.month && 
                       freq.data.year == hoje.year;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cor1,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.local_offer, color: Color(0xFF6B8E6B), size: 20),
                    SizedBox(width: 8),
                    Text("Frequência", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                
                if (ehHoje) 
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blueGrey, size: 20),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrarFrequencia(frequenciaParaEditar: freq),
                        ),
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(freq.descricao,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                const Icon(Icons.calendar_today, color: Colors.grey, size: 18),
                const SizedBox(width: 8),
                Text(dataFormatada, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}