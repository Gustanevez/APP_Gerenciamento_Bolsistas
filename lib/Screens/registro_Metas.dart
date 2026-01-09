import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/cadastro_metas_widgets.dart';
import 'package:gerenciamento_bolsistas/Models/metas.dart';
import 'package:gerenciamento_bolsistas/Models/metas_state_provider.dart';


class ProjetoMetasPage extends ConsumerStatefulWidget {
  const ProjetoMetasPage({super.key});

  @override
  ConsumerState<ProjetoMetasPage> createState() => _ProjetoMetasPageState();
}

class _ProjetoMetasPageState extends ConsumerState<ProjetoMetasPage> {
  
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _dataController = TextEditingController(); 
  
 
  Project? _projetoSelecionado;
  
  
  DateTime? _dataMeta;

  @override
  void dispose() {
    _tituloController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  void _limparCampos() {
    setState(() {
      _tituloController.clear();
      _dataController.clear();
      _projetoSelecionado = null;
      _dataMeta = null;
    });
  }

  Future<void> _selecionarData() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _dataMeta = picked;
        _dataController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // Função de Salvar
 void _salvarMeta() {
    // 1. Validação
    if (_projetoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione um projeto!")),
      );
      return;
    }
    if (_tituloController.text.isEmpty || _dataMeta == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha o título e a data!")),
      );
      return;
    }
    final novaMeta = Metas(
      projetoId: _projetoSelecionado!.id!, // Vincula ao projeto escolhido
      titulo: _tituloController.text,
      prazo: _dataMeta!,
      status: 'Pendente', // Define o status inicial
    );

    ref.read(metasProvider.notifier).addMeta(novaMeta);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Meta salva com sucesso!")),
    );

    Navigator.pop(context);
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
                "Registro de Metas",
                style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              
              const SizedBox(height: 50),

              SelecionarProjeto(
                label: "Selecione Projeto/Bolsista",
                hint: "Toque para escolher",
                onProjetoSelected: (projeto) {
                  setState(() {
                    _projetoSelecionado = projeto;
                  });
                },
              ),
              const SizedBox(height: 20),

              
              TituloMeta(
                label: "Título da meta",
                hint: "Ex: Revisão Bibliográfica",
                controller: _tituloController, 
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: _selecionarData, // Abre o calendário ao tocar
                child: AbsorbPointer(
                  child: CampoComIcone(
                    label: "Data Prazo",
                    icon: Icons.calendar_month,
                    hint: "dd/mm/aaaa",
                    controller: _dataController, // Conectado ao controller
                  ),
                ),
              ),

              const SizedBox(height: 300),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // BOTÃO SALVAR
                  Buttonactions(
                    text: "Salvar Metas",
                    onPressed: _salvarMeta, // Chama a função de salvar
                    size: Size(MediaQuery.of(context).size.width * 0.37, 46),
                    color: cor4,
                  ),

                  const SizedBox(width: 15),

                  // BOTÃO LIMPAR
                  Buttonactions(
                    text: "Limpar Campos",
                    onPressed: _limparCampos, // Chama a função de limpar
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