import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia_state_provider.dart';
import 'package:gerenciamento_bolsistas/Models/frequencia.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista_state_provider.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/widget_cadastrar_projeto.dart'; // Reaproveitando estilos

class RegistrarFrequencia extends ConsumerStatefulWidget {
  const RegistrarFrequencia({super.key});

  @override
  ConsumerState<RegistrarFrequencia> createState() =>
      _RegistrarFrequenciaState();
}

class _RegistrarFrequenciaState extends ConsumerState<RegistrarFrequencia> {
  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  DateTime? _dataSelecionada;
  String? _bolsistaId; // Armazena o ID do bolsista selecionado

  @override
  void dispose() {
    _descricao.dispose();
    _dataController.dispose();
    super.dispose();
  }

  Future<void> _selecionarData() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
    // Lendo a lista de bolsistas para o Dropdown
    final bolsistasAsync = ref.watch(bolsistaProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Olá, Coordenador",
                  style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Registrar Frequência",
                style: TextStyle(
                  fontFamily: 'ABeeZee',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),

              // --- SELETOR DE BOLSISTA ---
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

              // --- CAMPO DE DESCRIÇÃO ---
              Campo_projeto(
                label: "Descrição da Atividade",
                controller: _descricao,
              ),

              const SizedBox(height: 20),

              // --- SELETOR DE DATA ---
              GestureDetector(
                onTap: _selecionarData,
                child: AbsorbPointer(
                  child: CampoComIcone_projeto(
                    label: "Data da Frequência",
                    controller: _dataController,
                    icon: Icons.calendar_today,
                    hint: "Toque para selecionar",
                  ),
                ),
              ),

              const SizedBox(height: 80),

              Buttonactions(
                text: "Salvar Frequência",
                color: cor4, // Verde claro
                size: Size(MediaQuery.of(context).size.width * 0.6, 46),
                onPressed: () {
                  if (_descricao.text.isEmpty ||
                      _dataSelecionada == null ||
                      _bolsistaId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Preencha todos os campos!"),
                      ),
                    );
                    return;
                  }

                  // Criando o objeto de frequência
                  final novaFrequencia = Frequencia(
                    id: '', // Gerado pelo Firebase
                    data: _dataSelecionada!,
                    descricao: _descricao.text,
                    bolsistaId: _bolsistaId!,
                  );

                  // Enviando para o Firebase via Notifier
                  ref
                      .read(frequenciaProvider.notifier)
                      .addFrequencia(novaFrequencia);

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
