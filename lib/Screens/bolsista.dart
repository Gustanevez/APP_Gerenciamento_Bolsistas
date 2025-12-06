import 'package:flutter/material.dart';

class CadastroBolsistaScreen extends StatelessWidget {
  const CadastroBolsistaScreen({super.key});

  
  Widget _buildTextField(String label, {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          
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
          fillColor: Colors.white, 
        ),
      ),
    );
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
        
            Form(
              child: Column(
                children: [
                  
                  const SizedBox(height: 40),
                  _buildTextField('Nome'),
                  
                  
                  const SizedBox(height: 20),
                  _buildTextField('Email', type: TextInputType.emailAddress),

                  const SizedBox(height: 20),
                  
                  
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
                        
                      },
                    ),
                  ),

                  
                  
                  const SizedBox(height: 100),
                  
                  
                  ElevatedButton(
                    onPressed: () {
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