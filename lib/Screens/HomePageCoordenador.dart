  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:gerenciamento_bolsistas/Models/Project_State_provider.dart';
  import 'package:gerenciamento_bolsistas/Screens/BolsistasScreen.dart';
  import 'package:gerenciamento_bolsistas/Widgets/relatorio.dart';
  import 'package:gerenciamento_bolsistas/Style/colors.dart';
  import 'package:gerenciamento_bolsistas/Widgets/button.dart';
  import 'package:gerenciamento_bolsistas/Screens/RegisterProject.dart';
  import 'package:gerenciamento_bolsistas/Widgets/CardHomeCoordenador.dart';
  import 'package:gerenciamento_bolsistas/Widgets/Menu.dart';

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

              const Spacer(), 

              const Text(
                'Olá, Coordenador!',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ABeeZee',
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

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          
                          width: MediaQuery.of(context).size.width * 0.35,
                          height:
                              double.infinity, 
                          margin: const EdgeInsets.only(right: 15),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cor1,
                            borderRadius: BorderRadius.circular(
                              20,
                            ), 
                          ),

                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Image.asset(
                                'assets/Image/pessoas.png',
                                width: 40,
                                height: 40,
                                color: Colors.black, 
                              ),

                              
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Bolsistas Ativos', 
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),

                                  Text(
                                   
                                    (projetos.length +0 ).toString(),
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
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

                      
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                         
                          width: MediaQuery.of(context).size.width * 0.35,
                          height:
                              double.infinity,
                          margin: const EdgeInsets.only(right: 15),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cor1,
                            borderRadius: BorderRadius.circular(
                              20,
                            ), 
                          ),

                          
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            
                              Image.asset(
                                'assets/Image/e.png',
                                width: 40,
                                height: 40,
                                color: Colors.black,
                              ),

                              
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Projetos', 
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),

                                  Text(
                                                            (projetos.length +0).toString(),
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
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

                      
                      InkWell(
                        onTap: () {
                         
                        },
                        child: Container(
                     
                          width: MediaQuery.of(context).size.width * 0.35,
                          height:
                              double.infinity, 
                          margin: const EdgeInsets.only(right: 15),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cor1,
                            borderRadius: BorderRadius.circular(
                              20,
                            ), 
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

                              
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tempo de laboratório', 
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),

                                  Text(
                                    
                                    (projetos.length + 0).toString(),
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
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
