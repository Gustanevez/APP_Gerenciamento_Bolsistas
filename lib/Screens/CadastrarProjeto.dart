import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/projectStateProvider.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/widget_cadastrar_projeto.dart';

class CadastrarProjetoPage extends ConsumerStatefulWidget {
  const CadastrarProjetoPage({super.key});

  @override
  ConsumerState<CadastrarProjetoPage> createState() => _CadastrarProjetoPageState();
}

class _CadastrarProjetoPageState extends ConsumerState<CadastrarProjetoPage> {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataFimController = TextEditingController();

  DateTime? _dataInicioR;
  DateTime? _dataFimR;
  
  @override
  void dispose() {
    _titulo.dispose();
    _area.dispose();
    _dataInicioController.dispose();
    _dataFimController.dispose();
    super.dispose();
  }

  Future<void> _selecionarData(bool isInicio) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        
        String dataFormatada = "${picked.day}/${picked.month}/${picked.year}";
        if (isInicio) {
          _dataInicioR = picked; 
          _dataInicioController.text = dataFormatada; 
        } else {
          _dataFimR = picked;
          _dataFimController.text = dataFormatada;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
    ),
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

              GestureDetector(
                onTap: () => _selecionarData(true), 
                child: AbsorbPointer(
                  child: CampoComIcone_projeto(
                    label: "Data de Início",
                    controller: _dataInicioController,
                    icon: Icons.calendar_month,
                    hint: "Toque para selecionar",
                  ),
                ),
              ),

              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selecionarData(false), 
                child: AbsorbPointer(
                  child: CampoComIcone_projeto(
                    label: "Data de Fim",
                    controller: _dataFimController,
                    icon: Icons.event_busy, 
                    hint: "Toque para selecionar",
                  ),
                ),
              ),

              const SizedBox(height: 100),

             Buttonactions(
                text: "Salvar Projeto",
                color: cor4,
                size: Size(MediaQuery.of(context).size.width * 0.6, 46),
                onPressed: () {
                  if (_titulo.text.isEmpty || _area.text.isEmpty || _dataInicioR == null || _dataFimR == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Preencha todos os campos e datas!")),
                    );
                    return;
                  }
                  
                  final novoProjeto = Project(
                    titulo: _titulo.text,
                    area: _area.text,
                    dataInicio: _dataInicioR!, 
                    dataFim: _dataFimR!,       
                  );

                  // Enviando para o Firebase via Riverpod
                  ref.read(projectProvider.notifier).addProject(novoProjeto);
                  
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