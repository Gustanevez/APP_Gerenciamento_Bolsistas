import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gerenciamento_bolsistas/Models/authStateProvider.dart';

class BolsistaNotifier extends StreamNotifier<List<Bolsista>> {
  
  
  final CollectionReference bolsistaCollection = 
      FirebaseFirestore.instance.collection('bolsista');

  @override
  Stream<List<Bolsista>> build() {
    final user = ref.watch(authStateProvider).value;

    if (user == null) {
      return const Stream.empty();
    }


    return bolsistaCollection
        .where('coordenadorUid', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) {
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

final bolsistaLogadoProvider = StreamProvider<Bolsista?>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return const Stream.empty();

  return FirebaseFirestore.instance
      .collection('bolsistas')
      .where('uid', isEqualTo: user.uid) 
      .limit(1)
      .snapshots()
      .map((snapshot) {
        if (snapshot.docs.isEmpty) return null;
        return Bolsista.fromMap(snapshot.docs.first.data(), snapshot.docs.first.id);
      });
});


final bolsistaProvider =
    StreamNotifierProvider<BolsistaNotifier, List<Bolsista>>(BolsistaNotifier.new);