import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Screens/loginSelect.dart';

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
