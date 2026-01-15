import 'package:cloud_firestore/cloud_firestore.dart';

class Relatorio {
  final String id;
  final String titulo;
  final DateTime data;
  final String bolsistaId;

  Relatorio({
    required this.id, 
    required this.titulo, 
    required this.data, 
    required this.bolsistaId
  });

  
  factory Relatorio.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Relatorio(
      id: doc.id,
      titulo: data['titulo'] ?? '',
      data: (data['data'] as Timestamp).toDate(),
      bolsistaId: data['bolsistaId'] ?? '',
    );
  }

  
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'data': Timestamp.fromDate(data),
      'bolsistaId': bolsistaId,
    };
  }
}