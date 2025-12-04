import 'package:flutter/material.dart';

class RelatorioScreen extends StatelessWidget {
  const RelatorioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Ícone de voltar na esquerda
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        // Título "Olá, Coodernador!" e Ícone de Menu na direita
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 40,
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // --- Título Centralizado "Relatórios" ---
            const Text(
              'Relatórios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // --- Bloco Principal de Dados (A Tabela) ---
            _buildDataTableCard(),
            const SizedBox(height: 30),

            // --- Bloco de Botões de Exportação ---
            _buildExportButtons(),
          ],
        ),
      ),
    );
  }

  // --- Widget para a Tabela de Dados ---
  Widget _buildDataTableCard() {
    // Lista de dados LIMITADA A TRÊS exemplos, como você pediu
    final List<Map<String, dynamic>> data = [
      {
        'nome': 'Avila da Costa',
        'data': '12/07/2025',
        'status': true,
      }, // true = Aprovado (Check)
      {
        'nome': 'Wilma Silva',
        'data': '04/07/2025',
        'status': false,
      }, // false = Rejeitado (X)
      {
        'nome': 'Jonas Costa',
        'data': '28/09/2025',
        'status': true,
      }, // true = Aprovado (Check)
    ];

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        // Cor do contorno e fundo dos seus cards
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFC8E6C9), width: 1),
      ),
      child: Column(
        children: [
          // CABEÇALHO DA TABELA
          _buildTableRow(
            'Bolsistas',
            'Data de Envio',
            'Status',
            isHeader: true,
          ),
          const Divider(height: 1, color: Colors.black26),

          // LINHAS DE DADOS (Limitado a 3)
          ...data
              .map(
                (item) => _buildTableRow(
                  item['nome'],
                  item['data'],
                  '', // A coluna de status não tem texto, só ícone
                  isStatusIcon: true,
                  aprovado: item['status'],
                ),
              )
              .toList(),

          // Ícone de seta para baixo
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // --- Widget para Linhas da Tabela (AGORA COM ÍCONES CHECK/X) ---
  Widget _buildTableRow(
    String col1,
    String col2,
    String col3, {
    bool isHeader = false,
    bool isStatusIcon = false,
    bool aprovado = false,
  }) {
    final TextStyle headerStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      fontSize: 14,
    );
    final TextStyle dataStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black54,
    );

    // Define o ícone de Status se necessário
    Widget statusWidget;
    if (isHeader) {
      statusWidget = Text(col3, style: headerStyle, textAlign: TextAlign.right);
    } else if (isStatusIcon) {
      statusWidget = Icon(
        aprovado
            ? Icons.check_circle
            : Icons.cancel, // Check (Aprovar) ou X (Rejeitar)
        color: aprovado ? const Color(0xFF4CAF50) : const Color(0xFFE57373),
        size: 24,
      );
    } else {
      statusWidget = Text(col3, style: dataStyle, textAlign: TextAlign.right);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // COLUNA 1: BOLSISTA
          Expanded(
            flex: 4,
            child: Row(
              children: [
                if (!isHeader)
                  const Padding(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Icon(Icons.circle, size: 8, color: Colors.black54),
                  ),
                Flexible(
                  child: Text(
                    col1,
                    style: isHeader ? headerStyle : dataStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // COLUNA 2: DATA DE ENVIO
          Expanded(
            flex: 3,
            child: Text(
              col2,
              style: isHeader ? headerStyle : dataStyle,
              textAlign: TextAlign.center,
            ),
          ),

          // COLUNA 3: STATUS (ÍCONE)
          Expanded(
            flex: 3,
            child: Align(alignment: Alignment.centerRight, child: statusWidget),
          ),
        ],
      ),
    );
  }

  // --- Widget para Botões de Exportação (Mantido) ---
  Widget _buildExportButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildExportButton(
          text: 'Exportar em PDF',
          icon: Icons.picture_as_pdf,
          color: const Color(0xFF4CAF50), // Verde
          onPressed: () {
            // Lógica para exportar PDF
          },
        ),
        _buildExportButton(
          text: 'Exportar em Excel',
          icon: Icons.grid_on,
          color: const Color(0xFF4CAF50), // Verde
          onPressed: () {
            // Lógica para exportar Excel
          },
        ),
      ],
    );
  }

  // --- Widget de Botão de Exportação Individual (Mantido) ---
  Widget _buildExportButton({
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 20),
      label: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
      ),
    );
  }
}
