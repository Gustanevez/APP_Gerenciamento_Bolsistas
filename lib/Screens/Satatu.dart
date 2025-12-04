import 'package:flutter/material.dart';
// Importe seu arquivo de cores para manter a consistência
// import 'package:gerenciamento_bolsistas/Style/colors.dart'; 

// Definindo a cor base do seu projeto (assumindo cor1 seja o verde claro)
const Color cor1 = Color(0xFFA6F4A2); 
const Color cor2 = Color(0xFFF0F4F7); // Cor de fundo suave

// Esta tela pode ser chamada ao clicar em um item da lista Status de Relatórios e Frequências.
class DetalhesRelatorioScreen extends StatelessWidget {
  const DetalhesRelatorioScreen({super.key});

  // --- FUNÇÃO AUXILIAR PARA CRIAR OS BLOCOS DE INFORMAÇÃO ---
  Widget _buildInfoCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cor1, // Fundo verde claro
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Divider(color: Colors.black38, height: 20),
          ...children,
        ],
      ),
    );
  }

  // --- WIDGET PRINCIPAL ---
  @override
  Widget build(BuildContext context) {
    // Dados de exemplo simulados para esta tela
    const String periodo = "Setembro / 2025";
    const String statusGeral = "APROVADO";
    const Color statusColor = Colors.green;

    return Scaffold(
      backgroundColor: cor2, // Cor de fundo suave
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detalhes do Relatório',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- TÍTULO PRINCIPAL ---
            Text(
              'Relatório e Frequência - ${periodo.split('/').first}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // --- STATUS GERAL ---
            Row(
              children: [
                const Text('Status Atual: ', style: TextStyle(fontSize: 16)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    statusGeral,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // --- BLOCO 1: IDENTIFICAÇÃO E FREQUÊNCIA ---
            _buildInfoCard(
              title: 'Identificação e Frequência',
              children: [
                _buildDetailRow('Bolsista:', 'Wilma Silva'),
                _buildDetailRow('Período:', periodo),
                _buildDetailRow('Dias Trabalhados:', '20 dias'),
                _buildDetailRow('Total de Horas:', '80 horas'),
                _buildDetailRow('Observações:', 'Nenhuma ausência registrada.', isObservation: true),
              ],
            ),

            // --- BLOCO 2: RELATÓRIO DE ATIVIDADES ---
            _buildInfoCard(
              title: 'Relatório de Atividades',
              children: [
                _buildDetailRow('Meta Principal:', 'Conclusão do Módulo de Autenticação.'),
                _buildDetailRow('Atividades Realizadas:', '1. Desenvolvimento e testes do login via OAuth. 2. Documentação da API de usuários. 3. Pequena manutenção em bugs de layout no frontend.', isObservation: true),
                _buildDetailRow('Desafios:', 'Pequena dificuldade na integração do serviço X, resolvida com a ajuda da equipe técnica.', isObservation: true),
                _buildDetailRow('Próximos Passos:', 'Iniciar o desenvolvimento da tela de dashboard do coordenador (outubro).', isObservation: true),
              ],
            ),

            // --- BLOCO 3: FEEDBACK DO COORDENADOR ---
            _buildInfoCard(
              title: 'Feedback do Coordenador',
              children: [
                _buildDetailRow('Comentário:', '"Wilma, o trabalho neste período foi excelente, especialmente na resolução do problema de autenticação. Mantenha o foco na documentação no próximo mês. Aprovado."', isObservation: true, valueColor: Colors.black87),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget Auxiliar para Linhas de Detalhe ---
  Widget _buildDetailRow(String label, String value, {bool isObservation = false, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              if (!isObservation)
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 15, color: valueColor ?? Colors.black54),
                    ),
                  ),
                ),
            ],
          ),
          if (isObservation)
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 16.0), // Recuo para observações
              child: Text(
                value,
                style: TextStyle(fontSize: 15, color: valueColor ?? Colors.black54, fontStyle: FontStyle.italic),
              ),
            ),
        ],
      ),
    );
  }
}