import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia_state_provider.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/widget_cadastrar_projeto.dart';
import 'package:gerenciamento_bolsistas/Widgets/selecionarData.dart'; 

class RegistrarFrequencia extends ConsumerStatefulWidget {
  final Frequencia? frequenciaParaEditar;
  const RegistrarFrequencia({super.key, this.frequenciaParaEditar});

  @override
  ConsumerState<RegistrarFrequencia> createState() => _RegistrarFrequenciaState();
}

class _RegistrarFrequenciaState extends ConsumerState<RegistrarFrequencia> {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  DateTime? _dataSelecionada;

  @override
  void initState() {
    super.initState();
    if (widget.frequenciaParaEditar != null) {
      _descricao.text = widget.frequenciaParaEditar!.descricao;
      _dataSelecionada = widget.frequenciaParaEditar!.data;
      _dataController.text = "${_dataSelecionada!.day.toString().padLeft(2, '0')}/${_dataSelecionada!.month.toString().padLeft(2, '0')}/${_dataSelecionada!.year}";
    }
  }

  void _notificar(String msg, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontFamily: 'ABeeZee')),
        backgroundColor: cor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 160, left: 20, right: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdicao = widget.frequenciaParaEditar != null;
    final user = FirebaseAuth.instance.currentUser; 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          isEdicao ? "Editar Frequência" : "Registrar Frequência",
          style: const TextStyle(color: Colors.black, fontFamily: 'ABeeZee', fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              CampoProjeto(
                label: "Descrição da Atividade",
                controller: _descricao,
                quantChar: 80,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Digite no mínimo 80 caracteres";
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              
              SeletorDataCampo(
                label: "Data da Frequência",
                controller: _dataController,
                icone: Icons.calendar_today,

                dataInicialLimite: DateTime(2024), 
                onDataSelecionada: (data) {
                  setState(() => _dataSelecionada = data);
                },
              ),

              const SizedBox(height: 80),

              Buttonactions(
                text: isEdicao ? "Atualizar Frequência" : "Salvar Frequência",
                color: cor4,
                size: Size(MediaQuery.of(context).size.width * 0.6, 46),
                onPressed: () async {
                  if (user == null) {
                    _notificar("Erro: Usuário não autenticado.", Colors.red);
                    return;
                  }

                  if (_descricao.text.isEmpty || _dataSelecionada == null) {
                     _notificar("Preencha todos os campos.", Colors.orange);
                     return;
                  }

                  final bolsistaId = user.uid;

                  if (!isEdicao) {
                    final frequenciasAsync = ref.read(frequenciaProvider);
                    final existeRegistro = frequenciasAsync.maybeWhen(
                      data: (lista) => lista.any((f) =>
                          f.bolsistaId == bolsistaId &&
                          f.data.day == _dataSelecionada!.day &&
                          f.data.month == _dataSelecionada!.month &&
                          f.data.year == _dataSelecionada!.year),
                      orElse: () => false,
                    );

                    if (existeRegistro) {
                      _notificar("Você já possui um registro hoje.", Colors.orange);
                      return;
                    }
                  }

                  if (isEdicao) {
                    final editada = widget.frequenciaParaEditar!.copyWith(
                      descricao: _descricao.text,
                      data: _dataSelecionada!,
                      bolsistaId: bolsistaId,
                    );
                    await ref.read(frequenciaProvider.notifier).updateFrequencia(editada);
                    _notificar("Atualizado!", const Color(0xFFE8F5E9));
                  } else {
                    final nova = Frequencia(
                      id: '',
                      data: _dataSelecionada!,
                      descricao: _descricao.text,
                      bolsistaId: bolsistaId,
                    );
                    await ref.read(frequenciaProvider.notifier).addFrequencia(nova);
                    _notificar("Registrado!", cor1);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}