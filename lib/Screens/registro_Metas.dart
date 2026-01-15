import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/cadastro_metas_widgets.dart';
import 'package:gerenciamento_bolsistas/Widgets/selecionarData.dart'; 
import 'package:gerenciamento_bolsistas/Models/metas.dart';
import 'package:gerenciamento_bolsistas/Models/metas_state_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  void _notificar(String msg, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'ABeeZee')),
        backgroundColor: cor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 160,
          left: 20,
          right: 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _limparCampos() {
    setState(() {
      _tituloController.clear();
      _dataController.clear();
      _projetoSelecionado = null;
      _dataMeta = null;
    });
  }

  void _salvarMeta() {
    if (_projetoSelecionado == null) {
      _notificar("Selecione um projeto!", Colors.orange);
      return;
    }
    if (_tituloController.text.isEmpty || _dataMeta == null) {
      _notificar("Preencha o título e a data!", Colors.orange);
      return;
    }
    
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _notificar("Usuário não autenticado!", Colors.red);
      return;
    }

    final novaMeta = Metas(
      projetoId: _projetoSelecionado!.id!,
      titulo: _tituloController.text,
      prazo: _dataMeta!,
      coordenadorUid: user.uid,
      status: 'Pendente',
    );

    ref.read(metasProvider.notifier).addMeta(novaMeta);
    _notificar("Meta salva com sucesso!", Colors.green);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Registro de Metas",
          style: TextStyle(color: Colors.black, fontFamily: 'ABeeZee', fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Olá, Coordenador",
                  style: TextStyle(fontFamily: 'ABeeZee', fontSize: 14, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 30),

              SelecionarProjeto(
                label: "Projeto / Bolsista",
                hint: "Toque para escolher",
                onProjetoSelected: (projeto) {
                  setState(() => _projetoSelecionado = projeto);
                },
              ),
              const SizedBox(height: 20),

              TituloMeta(
                label: "Título da meta",
                hint: "Ex: Revisão Bibliográfica",
                controller: _tituloController,
              ),
              const SizedBox(height: 20),

              
              SeletorDataCampo(
                label: "Data Prazo",
                controller: _dataController,
                dataInicialLimite: DateTime.now(), 
                icone: Icons.calendar_month,
                onDataSelecionada: (data) {
                  setState(() => _dataMeta = data);
                },
              ),

              const SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Buttonactions(
                    text: "Salvar Meta",
                    onPressed: _salvarMeta,
                    size: Size(MediaQuery.of(context).size.width * 0.4, 48),
                    color: cor4,
                  ),
                  const SizedBox(width: 15),
                  Buttonactions(
                    text: "Limpar",
                    onPressed: _limparCampos,
                    size: Size(MediaQuery.of(context).size.width * 0.4, 48),
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}