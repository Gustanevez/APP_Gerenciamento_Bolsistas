import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerenciamento_bolsistas/Screens/relatorio.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';
import 'package:gerenciamento_bolsistas/Screens/RegisterProject.dart';
import 'package:gerenciamento_bolsistas/Widgets/CardHomeCoordenador.dart';
import 'package:gerenciamento_bolsistas/Widgets/Menu.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/Project_State_provider.dart';
import 'package:gerenciamento_bolsistas/Models/Project_provider.dart';

class Homepagecoordenador extends ConsumerWidget {
  const Homepagecoordenador({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final projetos = ref.watch(projectProvider);

    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        automaticallyImplyLeading:
            false, 
        title: Row(
          children: [
           
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, size: 28),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),

            const Spacer(), // empurra o texto para o centro

            const Text(
              'Olá, Coordenador!',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'ABeeZee',
                color: Colors.black,
              ),
            ),

            
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(
                text: 'Notificações',
                onPressed: () {},
                size: Size(MediaQuery.of(context).size.width * 0.9, 46),
                color: cor1,
                icon: Image.asset(
                  'assets/Image/notificacao.png',
                  color: Colors.black, // Propriedade do Image
                  width: 26, // Propriedade do Image
                  height: 26, // Propriedade do Image
                ),
              ),

              const SizedBox(height: 15),
              Column(
                children: [
                  Button(
                    text: 'Pendências',
                    onPressed: () {},
                    size: Size(MediaQuery.of(context).size.width * 0.9, 46),
                    color: cor1,
                    icon: Image.asset(
                      'assets/Image/pendencia.png',
                      color: Colors.black,
                      width: 26,
                      height: 26,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Cardhomecoordenador(),

              ),

              SizedBox(height: 20),

              Button(
                text: 'Bolsista',
                onPressed: () {},
                size: Size(MediaQuery.of(context).size.width * 0.9, 46),
                color: cor1,
                icon: Image.asset(
                  'assets/Image/bolsista.png',
                  color: Colors.black,
                  width: 26,
                  height: 26,
                ),
              ),

              SizedBox(height: 10),

              Button(
                text: 'Projetos e Metas',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Registerproject(),
                    ),
                  );
                },
                size: Size(MediaQuery.of(context).size.width * 0.9, 46),
                color: cor1,
                icon: Image.asset(
                  'assets/Image/data-limite.png',
                  color: Colors.black,
                  width: 26,
                  height: 26,
                ),
              ),

              SizedBox(height: 15),

              Button(
                text: 'Relatórios',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RelatorioScreen(),
                    ),
                  );
                },
                size: Size(MediaQuery.of(context).size.width * 0.9, 46),
                color: cor1,
                icon: Image.asset(
                  'assets/Image/relatorio1.png',
                  color: Colors.black,
                  width: 26,
                  height: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
