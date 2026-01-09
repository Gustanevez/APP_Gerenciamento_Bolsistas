import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/registro_Metas.dart';
import 'package:gerenciamento_bolsistas/Screens/cadastrarProjeto.dart';
import 'package:gerenciamento_bolsistas/Screens/projeto_details.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Widgets/cadastro_metas_widgets.dart';

class Registerproject extends StatelessWidget {
  const Registerproject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Olá, Coordenador',
            style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            _ListaMetas(),
            const SizedBox(height: 20),
            Buttonactions(
              text: "Registrar Metas",
              size: Size(MediaQuery.of(context).size.width * 0.7, 46),
              color: cor4,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProjetoMetasPage()),
                );
              },
            ),
            const SizedBox(height: 25),
            ProjetoDetails(),
            const SizedBox(height: 25),
            Buttonactions(
              text: "Cadastrar Projetos",
              size: Size(MediaQuery.of(context).size.width * 0.7, 46),
              color: cor4,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CadastrarProjetoPage()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
class _ListaMetas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7FCEB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          ListaMetas(),
        ],
      ),
    );
  }
}