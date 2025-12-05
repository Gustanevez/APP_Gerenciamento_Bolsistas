import 'package:flutter/material.dart';

// --- WIDGET PRINCIPAL ---

class CadastroBolsistaScreen extends StatelessWidget {
  const CadastroBolsistaScreen({super.key});

  // Widget auxiliar para criar os campos de entrada de texto padronizados
  Widget _buildTextField(String label, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          // Estilo arredondado (como no Figma)
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
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
          filled: true,
          fillColor: Colors.white, // Fundo branco dentro do campo
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Definindo cores suaves para o fundo (ajuste conforme o seu Style/colors.dart)
    const Color corFundo = Color(0xFFF0F4F7); 
    const Color corPrimaria = Color(0xFF4CAF50); // Verde para o botão de ação

    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Adicionar Bolsista',
          style: TextStyle(color: Colors.black, fontFamily: 'ABeeZee',
                  ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // --- FORMULÁRIO ---
            Form(
              child: Column(
                children: [
                  // CAMPO 1: Nome
                  const SizedBox(height: 40),
                  _buildTextField('Nome'),
                  
                  // CAMPO 2: Email
                  const SizedBox(height: 20),
                  _buildTextField('Email', type: TextInputType.emailAddress),

                  const SizedBox(height: 20),
                  
                  // CAMPO 3: Selecione Projeto (Dropdown)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        
                        labelText: 'Selecione Projeto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: const ['Projeto EcoTest', 'Projeto GeoMente', 'Projeto CodeClube']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                      onChanged: (value) {
                        // Lógica para salvar o valor do projeto
                      },
                    ),
                  ),

                  // --- Você pode adicionar mais campos aqui (CPF, Carga Horária, etc.) ---
                  
                  const SizedBox(height: 100),
                  
                  // --- BOTÃO CADASTRAR BOLSISTA ---
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para submeter o formulário
                      
                      print('Cadastrar Bolsista!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corPrimaria, 
                      minimumSize: const Size(double.infinity, 50), // Largura total
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                    ),
                    child: const Text('Cadastrar Bolsista', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}