import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista.dart';

class BolsistaNotifier extends StreamNotifier<List<Bolsista>> {
  
  
  final CollectionReference bolsistaCollection = 
      FirebaseFirestore.instance.collection('bolsista');

  @override
  Stream<List<Bolsista>> build() {
    return bolsistaCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Bolsista.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  
  Future<void> addBolsista(Bolsista metas) async {
    
    await bolsistaCollection.add(metas.toMap());
  }

  Future<void> removeBolsista(String metasId) async {
    await bolsistaCollection.doc(metasId).delete();
  }

  
}

final bolsistaProvider =
    StreamNotifierProvider<BolsistaNotifier, List<Bolsista>>(BolsistaNotifier.new);