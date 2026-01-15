import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/metas.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MetasNotifier extends StreamNotifier<List<Metas>> {
  
  
  final CollectionReference metasCollection = 
      FirebaseFirestore.instance.collection('metas');

  @override
 Stream<List<Metas>> build() {
    final user = FirebaseAuth.instance.currentUser;

   
    if (user == null) {
      return const Stream.empty();
    }
    
    return metasCollection
        .where('coordenadorUid', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Metas.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
  
  Future<void> addMeta(Metas metas) async {
    
    await metasCollection.add(metas.toMap());
  }

  Future<void> removeMetas(String metasId) async {
    await metasCollection.doc(metasId).delete();
  }
  
}

final metasProvider =
    StreamNotifierProvider<MetasNotifier, List<Metas>>(MetasNotifier.new);