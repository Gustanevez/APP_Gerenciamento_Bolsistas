import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia.dart';

final frequenciaProvider = AsyncNotifierProvider<FrequenciaNotifier, List<Frequencia>>(() {
  return FrequenciaNotifier();
});

class FrequenciaNotifier extends AsyncNotifier<List<Frequencia>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Frequencia>> build() async {
    final stream = _firestore
        .collection('frequencias')
        .orderBy('data', descending: true)
        .snapshots();

    return stream.map((snapshot) {
      return snapshot.docs.map((doc) => Frequencia.fromFirestore(doc)).toList();
    }).first; 
  }

  Future<void> addFrequencia(Frequencia frequencia) async {
    try {
      await _firestore.collection('frequencias').add(frequencia.toMap());
      ref.invalidateSelf(); 
    } catch (e) {
      print("Erro ao salvar frequência: $e");
      rethrow;
    }
  }

 
  Future<void> updateFrequencia(Frequencia frequencia) async {
    try {
      
      await _firestore
          .collection('frequencias')
          .doc(frequencia.id)
          .update(frequencia.toMap());
      
      ref.invalidateSelf(); 
    } catch (e) {
      print("Erro ao atualizar frequência: $e");
      rethrow;
    }
  }

  Future<void> deletarFrequencia(String id) async {
    await _firestore.collection('frequencias').doc(id).delete();
    ref.invalidateSelf();
  }
}