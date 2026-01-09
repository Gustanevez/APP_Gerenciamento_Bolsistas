import 'package:cloud_firestore/cloud_firestore.dart';

class Frequencia {
  final String id;
  final DateTime data;
  final String descricao;
  final String bolsistaId; 

  Frequencia({
    required this.id,
    required this.data,
    required this.descricao,
    required this.bolsistaId,
  });

  factory Frequencia.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Frequencia(
      id: doc.id,
      data: (data['data'] as Timestamp).toDate(),
      descricao: data['descricao'] ?? '',
      bolsistaId: data['bolsistaId'] ?? '',
    );
  }

 
  Map<String, dynamic> toMap() {
    return {
      'data': Timestamp.fromDate(data),
      'descricao': descricao,
      'bolsistaId': bolsistaId,
    };
  }
}