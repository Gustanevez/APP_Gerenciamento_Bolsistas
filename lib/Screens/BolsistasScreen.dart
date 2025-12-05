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
                                hintText: "Filtrar por nome...",
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

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(
                    const Color(0xFFBEE8B3),
                  ),
                  dataRowColor: MaterialStateProperty.resolveWith<Color?>((
                    Set<MaterialState> states,
                  ) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.green.shade100;
                    }
                    return null;
                  }),
                  columns: const [
                    DataColumn(label: Text('Nome')),
                    DataColumn(label: Text('Matrícula')),
                    DataColumn(label: Text('Orientador')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: List<DataRow>.generate(bolsistas.length, (index) {
                    final bolsista = bolsistas[index];
                    return DataRow(
                      color: MaterialStateProperty.all(
                        index.isEven ? const Color(0xFFDFF7E3) : Colors.white,
                      ),
                      cells: [
                        DataCell(Text(bolsista['nome']!)),
                        DataCell(Text(bolsista['matricula']!)),
                        DataCell(Text(bolsista['orientador']!)),
                        DataCell(Text(bolsista['status']!)),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> bolsistas = [
  {
    'nome': 'Wilma Santos',
    'matricula': '10188',
    'orientador': 'Jose',
    'status': 'Ativo',
  },
  {
    'nome': 'Avila Conce',
    'matricula': '11178',
    'orientador': 'Rafael',
    'status': 'Ativo',
  },
  {
    'nome': 'Lara Silva',
    'matricula': '12024',
    'orientador': 'Maria',
    'status': 'Ativo',
  },
  {
    'nome': 'Jonas Davi',
    'matricula': '10188',
    'orientador': 'Cláudio',
    'status': 'Inativo',
  },
  {
    'nome': 'Debriane S.',
    'matricula': '11428',
    'orientador': 'Jose',
    'status': 'Inativo',
  },
  {
    'nome': 'Cassios Matos',
    'matricula': '11726',
    'orientador': 'Maria',
    'status': 'Ativo',
  },
  {
    'nome': 'Silvane Santos',
    'matricula': '12658',
    'orientador': 'Rafael',
    'status': 'Ativo',
  },
  {
    'nome': 'Juliana Costa',
    'matricula': '12782',
    'orientador': 'Cláudio',
    'status': 'Inativo',
  },
  {
    'nome': 'Wills Antonio',
    'matricula': '17452',
    'orientador': 'Cláudio',
    'status': 'Ativo',
  },
];
