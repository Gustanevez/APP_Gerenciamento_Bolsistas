import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Models/relatorio.dart';
import 'package:gerenciamento_bolsistas/Models/relatorio_state_provider.dart';
import 'package:intl/intl.dart';

class EnviarRelatorioScreen extends ConsumerStatefulWidget {
  const EnviarRelatorioScreen({super.key});

  @override
  ConsumerState<EnviarRelatorioScreen> createState() =>
      _EnviarRelatorioScreenState();
}

class _EnviarRelatorioScreenState extends ConsumerState<EnviarRelatorioScreen> {
  final TextEditingController _tituloController = TextEditingController();
  File? _arquivoSelecionado;
  String _nomeArquivo = "Nenhum arquivo selecionado";

  Future<void> _selecionarArquivo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        _arquivoSelecionado = File(result.files.single.path!);
        _nomeArquivo = result.files.single.name;
      });
    }
  }

  void _enviarRelatorio() async {
    if (_tituloController.text.isEmpty || _arquivoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha o título e selecione um arquivo!"),
        ),
      );
      return;
    }

    try {
      final novoRelatorio = Relatorio(
        id: '',
        titulo: _tituloController.text,
        data: DateTime.now(),
        bolsistaId: 'ID_DO_USUARIO_LOGADO',
      );

      await ref.read(relatorioProvider.notifier).addRelatorio(novoRelatorio);

      setState(() {
        _tituloController.clear();
        _arquivoSelecionado = null;
        _nomeArquivo = "Nenhum arquivo selecionado";
      });

      _notificarSucesso(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao enviar: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final relatoriosAsync = ref.watch(relatorioProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Relatórios",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'ABeeZee',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Histórico de Envios",
              style: TextStyle(
                fontFamily: 'ABeeZee',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            relatoriosAsync.when(
              data: (lista) => lista.isEmpty
                  ? const Text("Nenhum relatório enviado ainda.")
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        final item = lista[index];
                        return _buildRelatorioItem(item);
                      },
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Text("Erro ao carregar histórico: $e"),
            ),

            const SizedBox(height: 30),
            const Divider(thickness: 1, color: Colors.black12),
            const SizedBox(height: 30),

            const Text(
              "Novo Envio",
              style: TextStyle(
                fontFamily: 'ABeeZee',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                hintText: "Título do Relatório (ex: Janeiro/26)",
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
              ),
            ),
            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: cor1,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.attach_file, color: Colors.green),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _nomeArquivo,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _selecionarArquivo,
                    child: const Text(
                      "Anexar",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Buttonactions(
              text: "Confirmar Envio",
              color: cor4,
              size: Size(MediaQuery.of(context).size.width, 52),
              onPressed: _enviarRelatorio,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildRelatorioItem(Relatorio item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file, color: Colors.black45),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.titulo,
                  style: const TextStyle(
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Enviado em: ${DateFormat('dd/MM/yyyy').format(item.data)}",
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
        ],
      ),
    );
  }

  void _notificarSucesso(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Relatório enviado!",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'ABeeZee', color: Colors.black),
        ),
        backgroundColor: cor1,
        behavior: SnackBarBehavior.floating, 
        margin: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).size.height - 160, 
          left: 20,
          right: 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
