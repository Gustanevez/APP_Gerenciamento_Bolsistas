import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';

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
              // TEXTO SUPERIOR (PADRÃO DO APP)
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

              // TÍTULO PRINCIPAL
              const Text(
                "Cadastrar Projeto",
                style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 50),

              // CAMPOS DE TEXTO PADRÃO
              _campo("Título do Projeto", controller: _titulo),
              const SizedBox(height: 20),

              _campo("Área", controller: _area),
              const SizedBox(height: 20),

              _campoComIcone(
                "Data de Início",
                controller: _dataInicio,
                icon: Icons.calendar_month,
                hint: "dd/mm/aaaa",
              ),

              const SizedBox(height: 300),

              // BOTÃO PADRÃO
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

  // CAMPOS DE TEXTO PADRÃO
  Widget _campo(String label, {required TextEditingController controller}) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'ABeeZee', fontSize: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _campoComIcone(
    String label, {
    required TextEditingController controller,
    required IconData icon,
    String hint = "",
  }) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
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
