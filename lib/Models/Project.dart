import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String? id;
  final String titulo;
  final String area;
  final DateTime dataFim;
  final DateTime dataInicio;
  final String coordenadorUid;
  final List<String> bolsista;

  Project({
    required this.titulo,
    required this.area,
    required this.dataInicio,
    required this.dataFim,
    required this.coordenadorUid,
    required this.bolsista,
    this.id,
  });

  factory Project.fromMap(Map<String, dynamic> map, String docId) {
    return Project(
      id: docId,
      titulo: map['titulo'] ?? '', 
      area: map['area'] ?? '',
      dataInicio: (map['dataInicio'] as Timestamp).toDate(),
      dataFim: (map['dataFim'] as Timestamp).toDate(),
      coordenadorUid: map['coordenadorUid'] ?? '', 
      bolsista: List<String>.from(map['bolsista'] ?? [],)
    );
  }

  
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'area': area,
      'dataInicio': dataInicio,
      'dataFim':dataFim,
      'coordenadorUid': coordenadorUid,
      'bolsista': bolsista,
    };
  }
}
