import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  final String? id;
  final String titulo;
  final String area;
  final DateTime dataFim;
  final DateTime dataInicio;

  Project({
    required this.titulo,
    required this.area,
    required this.dataInicio,
    required this.dataFim,
    this.id,
  });

  factory Project.fromMap(Map<String, dynamic> map, String docId) {
    return Project(
      id: docId, // Aqui guardamos o ID do documento
      titulo: map['name'] ?? '', 
      area: map['Àrea'] ?? '',
      dataInicio: (map['dataInicio'] as Timestamp).toDate(),
      dataFim: (map['dataFim'] as Timestamp).toDate(),
    );
  }

  
  Map<String, dynamic> toMap() {
    return {
      'name': titulo,
      'Área': area,
      'dataInicio': dataInicio,
      'dataFim':dataFim
      
    };
  }
}
