import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // gerado pelo flutterfire configure
import 'package:gerenciamento_bolsistas/Screens/loginSelect.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(// remove a faixa de debug
      home: const Login(), // sua tela inicial
    );
  }
}
