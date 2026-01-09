import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/metas.dart';


class MetasNotifier extends StreamNotifier<List<Metas>> {
  
  
  final CollectionReference projectsCollection = 
      FirebaseFirestore.instance.collection('metas');

  @override
  Stream<List<Metas>> build() {
    return projectsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Metas.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  
  Future<void> addMeta(Metas metas) async {
    
    await projectsCollection.add(metas.toMap());
  }

  Future<void> removeMetas(String metasId) async {
    await projectsCollection.doc(metasId).delete();
  }

  
}

final metasProvider =
    StreamNotifierProvider<MetasNotifier, List<Metas>>(MetasNotifier.new);