import 'package:cloud_firestore/cloud_firestore.dart';

class Metas {
  final String? id;
  final String titulo;
  final DateTime prazo;
  final String status;
  final String projetoId;
  Metas({
    this.id,
    required this.projetoId,
    required this.titulo,
    required this.prazo,
    required this.status,
  });

  factory Metas.fromMap(Map<String, dynamic> map, String docId) {
    return Metas(
      id: docId,
      titulo: map['name'] ?? '',
      status: map['status'] ?? 'Pendente',
      prazo: (map['Prazo'] as Timestamp).toDate(),
      projetoId: map['projetoId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': titulo, 'Prazo': prazo, 'status': status,'projetoId':projetoId};
  }
}
