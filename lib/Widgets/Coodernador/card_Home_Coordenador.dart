import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/bolsista_state_provider.dart';
import 'package:gerenciamento_bolsistas/Models/projectStateProvider.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/Coodernador/Info_card_home_coordenador.dart';

class card_home_coordenador extends ConsumerWidget {
  const card_home_coordenador({super.key, required this.projetos});

  final List<Project> projetos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projetoAsync = ref.watch(projectProvider);
    final bolsistaAsync = ref.watch(bolsistaProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
            InfoCardHomeCoordenador(titulo: 'Bolsistas ativos', 
            iconePath: 'assets/Image/pessoas.png', 
            valor: bolsistaAsync.when(
              data:(lista) => lista.length.toString(), 
              loading: () => '...', 
              error: (_, __) => '0'), 
              onTap: ()=>Navigator.pushNamed(context, 'Cadastro')),

            InfoCardHomeCoordenador(titulo: 'Projetos', 
            iconePath: 'assets/Image/e.png', 
            valor: projetoAsync.when(
              data:(lista) => lista.length.toString(), 
              loading: () => '...', 
              error: (_, __) => '0'), 
              onTap: ()=>Navigator.pushNamed(context, 'Cadastro_coordenador')),
          
          InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: double.infinity,
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cor1,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/Image/relogio.png',
                    width: 40,
                    height: 40,
                    color: Colors.black,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
