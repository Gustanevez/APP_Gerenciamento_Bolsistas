import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Screens/HomePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/HomePageCoordenador.dart';
import 'package:gerenciamento_bolsistas/Screens/LoginSelect.dart';

void main() {
  runApp(ProviderScope(child: Myapp()
    )
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
