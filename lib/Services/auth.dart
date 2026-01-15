import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Autenticacao {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 cadastraraUsuario({
  required String nome,
  required String email,
  required String senha,
  required String tipoUsuario
 })async{
  UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email, 
    password: senha,
    );
    await FirebaseFirestore.instance.collection('usuarios').doc(userCredential.user!.uid).set({
      'nome': nome,
      'email': email,
      'tipo': tipoUsuario,
      'criadoEm': FieldValue.serverTimestamp(),
    });
  }
   // No arquivo Services/auth.dart

Future<Map<String, dynamic>?> LogarUsuario(
    {required String email, required String senha}) async {
  try {
    // 1. Faz o login no Firebase Auth
    UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: senha);

    if (cred.user != null) {
      // 2. Busca o documento do usuário no Firestore para pegar o 'tipo'
      DocumentSnapshot userDoc = await _firestore
          .collection('usuarios')
          .doc(cred.user!.uid)
          .get();

      if (userDoc.exists) {
        // Retorna um mapa com o UID e o tipo encontrado
        return {
          'uid': cred.user!.uid,
          'tipoUsuario': userDoc['tipo'],
        };
      }
    }
    return null;
  } on FirebaseAuthException catch (e) {
    return {'error': e.message}; // Retorna o erro para ser exibido na UI
  }
}

}
