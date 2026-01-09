import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Widgets/cadastro_metas_widgets.dart'; // Import do seu widget SelecionarProjeto
import 'package:gerenciamento_bolsistas/Models/bolsista_state_provider.dart'; // Import do seu provider de bolsistas

class CadastroBolsistaScreen extends ConsumerStatefulWidget {
  const CadastroBolsistaScreen({super.key});

  @override
  ConsumerState<CadastroBolsistaScreen> createState() => _CadastroBolsistaScreenState();
}

class _CadastroBolsistaScreenState extends ConsumerState<CadastroBolsistaScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Project? _projetoSelecionado;

  @override
  void dispose() {
    
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  
  void _salvarBolsista() {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();

    
    if (nome.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha o nome e o e-mail!")),
      );
      return;
    }

    if (_projetoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione um projeto para este bolsista!")),
      );
      return;
    }

    
    final novoBolsista = Bolsista(
      nome: nome,
      email: email,
      projetoId: _projetoSelecionado!.id!, 
    );

    
    ref.read(bolsistaProvider.notifier).addBolsista(novoBolsista);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Bolsista cadastrado com sucesso!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    const Color corFundo = Color(0xFFF0F4F7);
    const Color corPrimaria = Color(0xFF4CAF50);

    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Adicionar Bolsista',
          style: TextStyle(color: Colors.black, fontFamily: 'ABeeZee'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            _buildTextField('Nome', _nomeController),
            
            const SizedBox(height: 20),
            
            _buildTextField('Email', _emailController, type: TextInputType.emailAddress),

            const SizedBox(height: 20),

            SelecionarProjeto(
              label: 'Vincular ao Projeto',
              hint: 'Escolha o projeto do bolsista',
              onProjetoSelected: (projeto) {
                setState(() {
                  _projetoSelecionado = projeto;
                });
              },
            ),

            const SizedBox(height: 100),

            ElevatedButton(
              onPressed: _salvarBolsista,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 3,
              ),
              child: const Text(
                'Cadastrar Bolsista', 
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
        ),
      ),
    );
  }
}