class Bolsista {
  final String? id;
  final String nome;
  final String email;
  final String projetoId;
  final String coordenadorUid;

  Bolsista({
  this.id, 
  required this.coordenadorUid,
  required this.projetoId, 
  required this.email,
  required this.nome
  
  });

  factory Bolsista.fromMap(Map<String, dynamic> map, String docId) {
    return Bolsista(
      id: docId,
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      projetoId: map['projetoId'] ?? '',
      coordenadorUid: map['coordenadorUid'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'projetoId': projetoId,
      'coordenadorUid': coordenadorUid,
    };
  }
}
