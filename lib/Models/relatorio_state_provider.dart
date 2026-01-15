import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/relatorio.dart';

final relatorioProvider = AsyncNotifierProvider<RelatorioNotifier, List<Relatorio>>(() {
  return RelatorioNotifier();
});

class RelatorioNotifier extends AsyncNotifier<List<Relatorio>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Relatorio>> build() async {
    
    final snapshot = await _firestore
        .collection('relatorios')
        .orderBy('data', descending: true)
        .get();

    return snapshot.docs.map((doc) => Relatorio.fromFirestore(doc)).toList();
  }

  Future<void> addRelatorio(Relatorio relatorio) async {
    try {
      
      await _firestore.collection('relatorios').add(relatorio.toMap());
      ref.invalidateSelf(); 
    } catch (e) {
      print("Erro ao salvar relatório: $e");
      rethrow;
    }
  }
}