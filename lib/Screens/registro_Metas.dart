import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/cadastro_metas_widgets.dart';

class ProjetoMetasPage extends StatelessWidget {
  const ProjetoMetasPage({super.key});

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
                "Registro de Metas",
                style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 50),

           
              Campo(label: "Selecione Projeto/Bolsista",),
              const SizedBox(height: 20),

              Campo(label: "Título da meta", hint: "Ex: Revisão Bibliográfica"),
              const SizedBox(height: 20),

              CampoComIcone(label:  "Data",
                icon: Icons.calendar_month,
                hint: "Prazo: 20/11",),

              const SizedBox(height: 300),

         
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buttonactions(
                    text: "Salvar Metas",
                    onPressed: () {},
                    size: Size(MediaQuery.of(context).size.width * 0.37, 46),
                    color: cor4,
                  ),

                  const SizedBox(width: 15),

                  Buttonactions(
                    text: "Limpar Campos",
                    onPressed: () {},
                    size: Size(MediaQuery.of(context).size.width * 0.37, 46),
                    color: const Color.fromARGB(255, 137, 137, 137),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}


