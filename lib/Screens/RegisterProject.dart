
import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Models/Project.dart';
import 'package:gerenciamento_bolsistas/Models/Project_State_provider.dart';
import 'package:gerenciamento_bolsistas/Style/colors.dart';
import 'package:gerenciamento_bolsistas/Widgets/buttonActions.dart';
import 'package:gerenciamento_bolsistas/Widgets/Menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Registerproject extends ConsumerStatefulWidget {
  const Registerproject({super.key});

  @override
  ConsumerState<Registerproject> createState () => _Registerproject();

}


class _Registerproject extends ConsumerState<Registerproject> {
  final _titulo = TextEditingController();
  final _area = TextEditingController();
  @override

  void clean (){
    _titulo.dispose();
    _area.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      //rawer: const Menu(), 
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Olá, Coordenador',
              style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(width: 357, height: 239),

                    SizedBox(height: 40),
                    SizedBox(
                      child: Text(
                        'Cadastrar Projeto',
                        style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 40),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Título',
                          style: TextStyle(fontFamily: 'ABeeZee', fontSize: 12),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 339,
                          child: TextField(
                            controller: _titulo,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Àrea',
                      style: TextStyle(fontFamily: 'ABeeZee', fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 339,
                      child: TextField(
                        controller: _area,
                        decoration: InputDecoration(                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Data inicio',style: TextStyle(
                      fontFamily: 'ABeeZee',
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  
                  
                ],
              ),
                Buttonactions(
                  text: 'Salvar',
                  onPressed: () {
                    final novoproject = Project(
                      titulo:  _titulo.text,
                      area: _area.text,
                    );
                    ref.read(projectProvider.notifier).addProject(novoproject);
                    Navigator.pop(context);
                  },
                  size: Size(MediaQuery.of(context).size.width * 0.6, 46),
                  color: cor4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

