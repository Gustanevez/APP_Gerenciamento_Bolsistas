import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/projectStateProvider.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/widget_cadastrar_projeto.dart';
import 'package:gerenciamento_bolsistas/Widgets/selecionarData.dart';

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
  final _formKey = GlobalKey<FormState>();

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

  // Notificação padronizada no topo
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

  void _salvarProjeto() {
    if (!_formKey.currentState!.validate()) return;

    if (_dataInicioR == null || _dataFimR == null) {
      _notificar("Selecione as datas de início e fim!", Colors.orange);
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _notificar("Usuário não autenticado", Colors.red);
      return;
    }
    
    final novoProjeto = Project(
      titulo: _titulo.text,
      area: _area.text,
      dataInicio: _dataInicioR!, 
      dataFim: _dataFimR!,
      coordenadorUid: user.uid,
      bolsista: [],          
    );

    ref.read(projectProvider.notifier).addProject(novoProjeto);
    _notificar("Projeto salvo com sucesso!", Colors.green);
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
          "Cadastrar Projeto",
          style: TextStyle(color: Colors.black, fontFamily: 'ABeeZee', fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Olá, Coordenador!',
                    style: TextStyle(fontSize: 14, fontFamily: 'ABeeZee', color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 30),
                
                CampoProjeto(
                  label: "Nome do Projeto",
                  controller: _titulo,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Digite o título do projeto';
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                CampoProjeto(
                  label: "Área de Atuação",
                  controller: _area,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Digite a área do projeto';
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                
                SeletorDataCampo(
                  label: "Data de Início",
                  controller: _dataInicioController,
                  icone: Icons.calendar_month,
                  onDataSelecionada: (data) {
                    setState(() {
                      _dataInicioR = data;
                      
                      if (_dataFimR != null && _dataFimR!.isBefore(data)) {
                        _dataFimR = null;
                        _dataFimController.clear();
                      }
                    });
                  },
                ),

                const SizedBox(height: 20),

                
                SeletorDataCampo(
                  label: "Data de Término",
                  controller: _dataFimController,
                  icone: Icons.event_busy,
                  dataInicialLimite: _dataInicioR, 
                  onDataSelecionada: (data) => setState(() => _dataFimR = data),
                ),

                const SizedBox(height: 60),

                Buttonactions(
                  text: "Salvar Projeto",
                  color: cor4,
                  size: Size(MediaQuery.of(context).size.width * 0.7, 48),
                  onPressed: _salvarProjeto,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}