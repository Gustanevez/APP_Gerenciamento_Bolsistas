
import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageCoordenador.dart';
import 'package:gerenciamento_bolsistas/Screens/loginSelect.dart';
import 'package:gerenciamento_bolsistas/Screens/register_Project.dart';
import 'package:gerenciamento_bolsistas/Widgets/Relatorio.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFA6F4A2), 
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                 
                  icon: const Icon(Icons.menu, size: 28, color: Colors.black),
                  onPressed: () {
                    // Fecha o Drawer ao ser clicado
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),

            const SizedBox(height: 5),

           
            _menuItem(
             
              iconPath: "assets/Image/home.png",
              text: "Dashboard",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepagecoordenador(),
                  ),
                ); 
              },
            ),

            _menuItem(
              iconPath: "assets/Image/listabolsistas.png",
              text: "Lista de Bolsistas",
              onTap: () {},
            ),
            _menuItem(
              iconPath:
                  "assets/Image/data-limite.png", 
              text: "Projetos e Metas",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registerproject()),
                );
              },
            ),
            _menuItem(
              iconPath:
                  "assets/Image/relatorio1.png",
              text: "Relatórios",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RelatorioScreen(),
                  ),
                );
              },
            ),
            _menuItem(
              iconPath:
                  "assets/Image/data-limite.png", 
              text: "Agenda de Prazos",
              onTap: () {},
            ),
            _menuItem(
              iconPath: "assets/Image/notificacao.png",
              text: "Notificações",
              onTap: () {},
            ),
            _menuItem(
              iconPath:
                  "assets/Image/configuracoes.png", 
              text: "Configurações",
              onTap: () {},
            ),
            _menuItem(
              iconPath:
                  "assets/Image/ajuda.png", 
              text: "Ajuda",
              onTap: () {},
            ),

            // --- SEPARADOR (DIVIDER) ---
            const Divider(
              color: Colors.black45,
              height: 40,
              indent: 15,
              endIndent: 15,
            ),

           
            _menuItem(
              iconPath:
                  "assets/Image/sair.png", 
              text: "Sair",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (rout) => false,
                );
              
              },
            ), 
          ],
        ),
      ),
    );
  }

 
  Widget _menuItem({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 24, height: 24),

            const SizedBox(width: 10), 

            Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
