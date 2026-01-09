  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:gerenciamento_bolsistas/Models/project_State_provider.dart';
  import 'package:gerenciamento_bolsistas/Screens/BolsistasScreen.dart';
  import 'package:gerenciamento_bolsistas/Widgets/relatorio.dart';
  import 'package:gerenciamento_bolsistas/Style/colors.dart';
  import 'package:gerenciamento_bolsistas/Widgets/button.dart';
  import 'package:gerenciamento_bolsistas/Screens/register_project.dart';
  import 'package:gerenciamento_bolsistas/Widgets/card_home_coordenador.dart';
  import 'package:gerenciamento_bolsistas/Widgets/Menu.dart';

    class Homepagecoordenador extends ConsumerWidget {
      const Homepagecoordenador({super.key});

      @override
      Widget build(BuildContext context, WidgetRef ref) {
        final projetosAsync = ref.watch(projectProvider);
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

                const Spacer(), 

                const Text(
                  'Olá, Coordenador!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'BeeZee',
                    color: Colors.black,
                  ),
                ),

                const Spacer(), 
              
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
                      color: Colors.black, 
                      width: 26, 
                      height: 26, 
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

                  projetosAsync.when(
                data: (listaDeProjetos) {
                  // Se chegou os dados, mostramos o card passando a lista limpa
                  return card_home_coordenador(projetos: listaDeProjetos);
                },
                loading: () => const SizedBox(
                  height: 200, // Altura aproximada do card para não "pular" layout
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => Center(
                  child: Text('Erro ao carregar: $error'),
                ),
              ),

                  SizedBox(height: 20),

                  Button(
                    text: 'Bolsista',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BolsistasScreen(),
                        ),
                      );
                    },
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
