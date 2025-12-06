import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageCoordenador.dart';
import 'package:gerenciamento_bolsistas/Widgets/widget_tela_login.dart';

class LoginSenha extends StatefulWidget {
  final String tipoUsuario; 

  const LoginSenha({super.key, required this.tipoUsuario});

  @override
  State<LoginSenha> createState() => _LoginSenhaState();
}

class _LoginSenhaState extends State<LoginSenha> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              Image.asset(
                'assets/Image/topo.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 0),

             
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.tipoUsuario == "coordenador"
                            ? "Login Coordenador"
                            : "Login Bolsista",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 25),

                      EmailField(),
                      const SizedBox(height: 18),

                      EmailField(),
                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                              color: Color(0xFF4CAF50),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                     
                    ButtonEntrar(onPressed: _entrar),
                    
                      const SizedBox(height: 20),

                      const Center(child: Text("Ou continue com")),
                      const SizedBox(height: 15),

                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialButton(imagePath: "assets/Image/google.png"),
                          SocialButton(imagePath: 'assets/Image/suap.png'),
                        ],
                      ),

                      const SizedBox(height: 25),

                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Não possui conta? ",
                            style: TextStyle(fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                         
                            },
                            child: const Text(
                              "Crie agora",
                              style: TextStyle(
                                color: Color(0xFF4CAF50),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _entrar() {
    if (widget.tipoUsuario == "coordenador") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepagecoordenador()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepagebolsista()),
      );
    }
  }
}