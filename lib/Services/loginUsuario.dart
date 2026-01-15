import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/home_page_coordenador.dart';
import 'package:gerenciamento_bolsistas/Screens/loginSelect.dart';

class VerificaLogin extends StatelessWidget {
  const VerificaLogin({super.key});

  Future<String?> _decidirHome(User user) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user.uid)
        .get();

    if (doc.exists) {
      return doc['tipo'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (cointext, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData && snapshot.data != null) {
          return FutureBuilder<String?>(
            future: _decidirHome(snapshot.data!),
            builder: (context, tipoSnap) {
              if (tipoSnap.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (tipoSnap.hasData) {
                if (tipoSnap.data == 'coordenador') {
                  return const Homepagecoordenador();
                } else if (tipoSnap.data == 'bolsista') {
                  return Homepagebolsista();
                }
              }
              return const Login();
            },
          );
        }
        return const Login();
      },
    );
  }
}
