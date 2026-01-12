import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia_state_provider.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista_state_provider.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/widget_cadastrar_projeto.dart';

class RegistrarFrequencia extends ConsumerStatefulWidget {
  final Frequencia? frequenciaParaEditar;
  const RegistrarFrequencia({super.key, this.frequenciaParaEditar});

  @override
  ConsumerState<RegistrarFrequencia> createState() =>
      _RegistrarFrequenciaState();
}

class _RegistrarFrequenciaState extends ConsumerState<RegistrarFrequencia> {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  DateTime? _dataSelecionada;
  String? _bolsistaId;

  @override
  void initState() {
    super.initState();
    if (widget.frequenciaParaEditar != null) {
      _descricao.text = widget.frequenciaParaEditar!.descricao;
      _dataSelecionada = widget.frequenciaParaEditar!.data;
      _bolsistaId = widget.frequenciaParaEditar!.bolsistaId;
      _dataController.text =
          "${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}";
    }
  }

  void _notificar(String msg, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black, fontFamily: 'ABeeZee'),
        ),
        backgroundColor: cor,
        behavior: SnackBarBehavior
            .floating, // Necessário para permitir o reposicionamento
        margin: EdgeInsets.only(
          // Calcula a distância do fundo para empurrar o SnackBar para o topo
          bottom: MediaQuery.of(context).size.height - 160,
          left: 20,
          right: 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _selecionarData() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _dataSelecionada = picked;
        _dataController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bolsistasAsync = ref.watch(bolsistaProvider);
    final isEdicao = widget.frequenciaParaEditar != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Centraliza o título para seguir o padrão
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          isEdicao ? "Editar Frequência" : "Registrar Frequência",
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'ABeeZee',
            fontSize: 22, // Tamanho padrão de títulos de AppBar
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 20),

              bolsistasAsync.when(
                data: (lista) => DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Selecione o Bolsista",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: _bolsistaId,
                  items: lista
                      .map(
                        (b) =>
                            DropdownMenuItem(value: b.id, child: Text(b.nome)),
                      )
                      .toList(),
                  onChanged: (val) => setState(() => _bolsistaId = val),
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, s) => const Text("Erro ao carregar bolsistas"),
              ),
              const SizedBox(height: 20),
              Campo_projeto(
                label: "Descrição da Atividade",
                controller: _descricao,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _selecionarData,
                child: AbsorbPointer(
                  child: CampoComIcone_projeto(
                    label: "Data da Frequência",
                    controller: _dataController,
                    icon: Icons.calendar_today,
                  ),
                ),
              ),
              const SizedBox(height: 80),

              Buttonactions(
                // O texto do botão muda se for edição
                text: isEdicao ? "Atualizar Frequência" : "Salvar Frequência",
                color: isEdicao ? cor4 : cor4,
                size: Size(MediaQuery.of(context).size.width * 0.6, 46),
                onPressed: () async {
                  if (_descricao.text.isEmpty ||
                      _dataSelecionada == null ||
                      _bolsistaId == null)
                    return;

                  if (!isEdicao) {
                    final frequenciasAsync = ref.read(frequenciaProvider);
                    final existeRegistro = frequenciasAsync.maybeWhen(
                      data: (lista) => lista.any(
                        (f) =>
                            f.bolsistaId == _bolsistaId &&
                            f.data.day == _dataSelecionada!.day &&
                            f.data.month == _dataSelecionada!.month &&
                            f.data.year == _dataSelecionada!.year,
                      ),
                      orElse: () => false,
                    );

                    if (existeRegistro) {
                      _notificar(
                        "Você já possui um registro hoje. Utilize o Histórico para editar.",
                        Colors.orange,
                      );
                      return;
                    }
                  }

                  if (isEdicao) {
                    final editada = widget.frequenciaParaEditar!.copyWith(
                      descricao: _descricao.text,
                      data: _dataSelecionada!,
                      bolsistaId: _bolsistaId!,
                    );
                    await ref
                        .read(frequenciaProvider.notifier)
                        .updateFrequencia(editada);
                    _notificar(
                      "Atualizado!",
                      const Color(0xFFE8F5E9),
                    );
                  } else {
                    final nova = Frequencia(
                      id: '',
                      data: _dataSelecionada!,
                      descricao: _descricao.text,
                      bolsistaId: _bolsistaId!,
                    );
                    await ref
                        .read(frequenciaProvider.notifier)
                        .addFrequencia(nova);
                    _notificar("Registro!", cor1);
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
