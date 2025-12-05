import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/CadastrarProjeto.dart';
import 'package:gerenciamento_bolsistas/Screens/bolsista.dart';

class BolsistasScreen extends StatelessWidget {
  const BolsistasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra de busca e botão
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Filtrar por nome, projeto...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9ED99D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroBolsistaScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "+ Adicionar Bolsista",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Tabela de bolsistas
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F7DA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildHeaderRow(),
                    const SizedBox(height: 4),
                    _buildDataRow(
                      "Wilma Santos",
                      "C.C",
                      "10188",
                      "Jose",
                      "Ativo",
                    ),
                    _buildDataRow(
                      "Avila Conce",
                      "C.A",
                      "11178",
                      "Rafael",
                      "Ativo",
                    ),
                    _buildDataRow(
                      "Lara Silva",
                      "MAT",
                      "12024",
                      "Maria",
                      "Ativo",
                    ),
                    _buildDataRow(
                      "Jonas Davi",
                      "C.C",
                      "10188",
                      "Cláudio",
                      "Inativo",
                    ),
                    _buildDataRow(
                      "Debriane S.",
                      "C.A",
                      "11428",
                      "Jose",
                      "Inativo",
                    ),
                    _buildDataRow(
                      "Cassios Matos",
                      "C.C",
                      "11726",
                      "Maria",
                      "Ativo",
                    ),
                    _buildDataRow(
                      "Silvane Santos",
                      "MAT",
                      "12658",
                      "Rafael",
                      "Ativo",
                    ),
                    _buildDataRow(
                      "Juliana Costa",
                      "MAT",
                      "12782",
                      "Cláudio",
                      "Inativo",
                    ),
                    _buildDataRow(
                      "Wills Antonio",
                      "C.C",
                      "17452",
                      "Cláudio",
                      "Ativo",
                    ),
                    const SizedBox(height: 8),
                    const Icon(Icons.keyboard_arrow_down, size: 28),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "Projetos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              _buildProjeto(
                "EcoTest",
                "Inovação em alimentos sustentáveis e com menor impacto ambiental.",
                "assets/perfil1.png",
              ),
              _buildProjeto(
                "GeoMente",
                "Abordagem criativa de conceitos geométricos no raciocínio visual.",
                "assets/perfil2.png",
              ),
              _buildProjeto(
                "NeuroCode",
                "Plataforma que une programação e modelos inspirados no cérebro.",
                "assets/perfil3.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Cabeçalho da tabela alinhado com flex
Widget _buildHeaderRow() {
  return Row(
    children: const [
      Expanded(
        flex: 2,
        child: Text("Nome", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Expanded(
        flex: 1,
        child: Text("Curso", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Expanded(
        flex: 1,
        child: Text("Matrícula", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Expanded(
        flex: 2,
        child: Text(
          "Orientador",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

// Linha de dados alinhada
Widget _buildDataRow(String n, String c, String m, String o, String s) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Expanded(flex: 2, child: Text(n)),
        Expanded(flex: 1, child: Text(c)),
        Expanded(flex: 1, child: Text(m)),
        Expanded(flex: 2, child: Text(o)),
        Expanded(flex: 1, child: Text(s)),
      ],
    ),
  );
}

// Cards de projeto
Widget _buildProjeto(String nome, String desc, String img) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFFE3F7DA),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        CircleAvatar(radius: 25, backgroundImage: AssetImage(img)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ],
    ),
  );
}
