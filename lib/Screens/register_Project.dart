import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/cadastrarProjeto.dart';
import 'package:gerenciamento_bolsistas/Screens/registro_Metas.dart';
import 'package:gerenciamento_bolsistas/Screens/neuro_code_Page.dart';
import 'package:gerenciamento_bolsistas/Screens/ecoTestPage.dart';
import 'package:gerenciamento_bolsistas/Screens/geoMentePage.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';

class Registerproject extends StatelessWidget {
  const Registerproject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Olá, Coordenador',
            style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            _ListaMetas(),
            const SizedBox(height: 20),
            Buttonactions(
              text: "Registrar Metas",
              size: Size(MediaQuery.of(context).size.width * 0.7, 46),
              color: cor4,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProjetoMetasPage()),
                );
              },
            ),
            const SizedBox(height: 25),
            _ListaProjetos(),
            const SizedBox(height: 25),
            Buttonactions(
              text: "Cadastrar Projetos",
              size: Size(MediaQuery.of(context).size.width * 0.7, 46),
              color: cor4,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CadastrarProjetoPage()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _ListaMetas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7FCEB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Metas",
            style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
          ),
          const SizedBox(height: 15),
          const _MetaItem(
            numero: "1.",
            titulo: "Concluir Revisão Bibliográfica",
            prazo: "20/11",
            status: "Em andamento",
            statusColor: Colors.green,
            iconStatus: Icons.refresh,
          ),
          const SizedBox(height: 20),
          const _MetaItem(
            numero: "2.",
            titulo: "Enviar Relatório e Frequência",
            prazo: "21/12",
            status: "Concluída",
            statusColor: Colors.green,
            iconStatus: Icons.check_circle,
          ),
        ],
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final String numero;
  final String titulo;
  final String prazo;
  final String status;
  final Color statusColor;
  final IconData iconStatus;

  const _MetaItem({
    required this.numero,
    required this.titulo,
    required this.prazo,
    required this.status,
    required this.statusColor,
    required this.iconStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(numero, style: const TextStyle(fontFamily: 'ABeeZee')),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  "Prazo: $prazo",
                  style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      "Status: $status",
                      style: TextStyle(
                        fontFamily: 'ABeeZee',
                        fontSize: 12,
                        color: statusColor,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(iconStatus, color: statusColor, size: 18),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: const [
              Icon(Icons.edit, color: Colors.black54),
              SizedBox(height: 10),
              Icon(Icons.delete, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }
}

class _ListaProjetos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE7FCEB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projetos",
            style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
          ),
          const SizedBox(height: 15),
          _ProjetoItem(
            titulo: "1. Neuro Code",
            pageDestino: const NeuroCodePage(),
          ),
          const SizedBox(height: 12),
          _ProjetoItem(titulo: "2. EcoTest", pageDestino: const EcoTestPage()),
          const SizedBox(height: 12),
          _ProjetoItem(
            titulo: "3. GeoMente",
            pageDestino: const GeoMentePage(),
          ),
        ],
      ),
    );
  }
}

class _ProjetoItem extends StatelessWidget {
  final String titulo;
  final Widget pageDestino;

  const _ProjetoItem({required this.titulo, required this.pageDestino});

  @override
  Widget build(BuildContext context) {
    
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          debugPrint('Clicou no projeto: $titulo');
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => pageDestino));
        },
        child: Container(
          height: 70,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              titulo,
              style: const TextStyle(fontFamily: 'ABeeZee', fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
