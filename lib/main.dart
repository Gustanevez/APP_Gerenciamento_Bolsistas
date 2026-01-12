import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gerenciamento_bolsistas/Screens/CadastrarProjeto.dart';
import 'package:gerenciamento_bolsistas/Screens/cadastrar_bolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/home_page_coordenador.dart';
import 'package:gerenciamento_bolsistas/Screens/historico_frequencia.dart';
import 'package:gerenciamento_bolsistas/Screens/enviar_relatorio.dart';
import 'firebase_options.dart'; // gerado pelo flutterfire configure
import 'package:gerenciamento_bolsistas/Screens/loginSelect.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        'Cadastro': (context) => const CadastroBolsistaScreen(),
        'Projeto': (context) => const Homepagecoordenador(),
        'Cadastro_coordenador': (context) => const CadastrarProjetoPage(),
        'home_bolsista': (context) => const Homepagebolsista(),
        'historico_frequencia': (context) => const HistoricoFrequenciaScreen(),
        'enviar_relatorio': (context) => const EnviarRelatorioScreen(),
      }, // remove a faixa de debug
      home: const Login(), // sua tela inicial
    );
  }
}
