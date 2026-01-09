class Bolsista {
  final String? id;
  final String nome;
  final String email;
  final String projetoId;

  Bolsista({this.id, 
  required this.projetoId, 
  required this.email,
  required this.nome
  });

  factory Bolsista.fromMap(Map<String, dynamic> map, String docId) {
    return Bolsista(
      id: docId,
      nome: map['name'] ?? '',
      email: map['email'] ?? '',
      projetoId: map['projetoId'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': nome,
      'email': email,
      'projetoId': projetoId,
    };
  }
}
