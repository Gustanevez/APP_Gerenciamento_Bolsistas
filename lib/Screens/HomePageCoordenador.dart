import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Widgets/relatorio.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/button.dart';
import 'package:gerenciamento_bolsistas/Screens/RegisterProject.dart';
import 'package:gerenciamento_bolsistas/Widgets/CardHomeCoordenador.dart';
import 'package:gerenciamento_bolsistas/Widgets/Menu.dart';

class Homepagecoordenador extends StatelessWidget {
  const Homepagecoordenador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove o ícone automático do Flutter
        title: Row(
          children: [
            // Ícone do Menu (abre o Drawer)
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

            const Spacer(), // empurra a seta para a direita
            // Ícone de voltar (lado direito)
            // IconButton(
            //   icon: const Icon(Icons.arrow_back_ios_new, size: 22),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Button(
                      text: 'teste',
                      size: Size(
                        MediaQuery.of(context).size.width * 0.3,
                        (MediaQuery.of(context).size.height * 0.01),
                      ),
                    ),
                    Button(
                      text: 'teste',
                      size: Size(
                        MediaQuery.of(context).size.width * 0.3,
                        (MediaQuery.of(context).size.height * 0.01),
                      ),
                    ),
                    Button(
                      text: 'teste',
                      size: Size(
                        MediaQuery.of(context).size.width * 0.3,
                        (MediaQuery.of(context).size.height * 0.01),
                      ),
                    ),
                    Button(
                      text: 'teste',
                      size: Size(
                        MediaQuery.of(context).size.width * 0.3,
                        (MediaQuery.of(context).size.height * 0.01),
                      ),
                    ),
                  ],
                ),
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
