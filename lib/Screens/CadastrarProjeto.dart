import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/widget_cadastrar_projeto.dart';

class CadastrarProjetoPage extends StatefulWidget {
  const CadastrarProjetoPage({super.key});

  @override
  State<CadastrarProjetoPage> createState() => _CadastrarProjetoPageState();
}

class _CadastrarProjetoPageState extends State<CadastrarProjetoPage> {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _dataInicio = TextEditingController();

  @override
  void dispose() {
    _titulo.dispose();
    _area.dispose();
    _dataInicio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  "Olá, Coordenador",
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 65),

              
              const Text(
                "Cadastrar Projeto",
                style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 50),

              
              Campo_projeto(label:"Título do Projeto", controller: _titulo),
              const SizedBox(height: 20),

              Campo_projeto(label: "Área", controller: _area),
              const SizedBox(height: 20),

              CampoComIcone_projeto(
                label: "Data de Início",
                controller: _dataInicio,
                icon: Icons.calendar_month,
                hint: "dd/mm/aaaa",
              ),

              const SizedBox(height: 300),

          
              Buttonactions(
                text: "Salvar Projeto",
                color: cor4,
                size: Size(MediaQuery.of(context).size.width * 0.6, 46),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}