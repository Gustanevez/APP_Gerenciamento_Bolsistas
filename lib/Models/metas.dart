import 'package:cloud_firestore/cloud_firestore.dart';

class Metas {
  final String? id;
  final String titulo;
  final DateTime prazo;
  final String status;
  final String projetoId;
  final String coordenadorUid;
  Metas({
    this.id,
    required this.projetoId,
    required this.coordenadorUid,
    required this.titulo,
    required this.prazo,
    required this.status,
  });

  factory Metas.fromMap(Map<String, dynamic> map, String docId) {
  return Metas(
    id: docId,
    titulo: map['name'] ?? map['titulo'] ?? '', 
    status: map['status'] ?? 'Pendente',
    prazo: map['prazo'] != null 
        ? (map['prazo'] as Timestamp).toDate() 
        : DateTime.now(), 
        
    projetoId: map['projetoId'] ?? '',
    coordenadorUid: map['coordenadorUid'] ?? '',
  );
}

  Map<String, dynamic> toMap() {
    return {'name': titulo, 
    'prazo': prazo,
    'status': status,
    'projetoId':projetoId,
    'coordenadorUid': coordenadorUid,
    };
  }
}
