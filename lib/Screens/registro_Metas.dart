import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';

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

           
              _campo("Selecione Projeto/Bolsista"),
              const SizedBox(height: 20),

              _campo("Título da meta", hint: "Ex: Revisão Bibliográfica"),
              const SizedBox(height: 20),

              _campoComIcone(
                "Data",
                icon: Icons.calendar_month,
                hint: "Prazo: 20/11",
              ),

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

  Widget _campo(String label, {String hint = ""}) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(fontFamily: 'ABeeZee', fontSize: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _campoComIcone(
    String label, {
    required IconData icon,
    String hint = "",
  }) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(fontFamily: 'ABeeZee', fontSize: 12),
          suffixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
