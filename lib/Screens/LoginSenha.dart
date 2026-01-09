import 'package:flutter/material.dart';
import 'package:gerenciamento_bolsistas/Screens/homePageBolsista.dart';
import 'package:gerenciamento_bolsistas/Screens/home_page_coordenador.dart';
import 'package:gerenciamento_bolsistas/Widgets/widget_tela_login.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginSenha extends StatefulWidget {
  final String tipoUsuario; 

  const LoginSenha({super.key, required this.tipoUsuario});

  @override
  State<LoginSenha> createState() => _LoginSenhaState();
}

class _LoginSenhaState extends State<LoginSenha> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _estaCarregando = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }
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

                      EmailField(controller: _emailController,),
                      const SizedBox(height: 18),

                      PasswordField(controller: _senhaController),
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
                    
                      const SizedBox(height: 20),
                          _estaCarregando 
                        ? const Center(child: CircularProgressIndicator(color: Color(0xFF4CAF50)))
                        : ButtonEntrar(onPressed: _entrar),

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

Future<void> _entrar() async {
  if (_formKey.currentState!.validate()) {
    setState(() => _estaCarregando = true);

    try {
      // 1. Tenta o login no Auth
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _senhaController.text.trim(),
      );

      // 2. Busca o perfil no Firestore usando o UID
      String uid = userCredential.user!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(uid)
          .get();

      if (userDoc.exists) {
        // 3. Pega o valor do campo 'tipo' que você criou no console
        String tipoNoBanco = userDoc.get('tipo'); 

        // 4. Compara com o tipo de login da tela atual
        if (tipoNoBanco == widget.tipoUsuario) {
          if (mounted) {
            // Vai para a Home correta
            Navigator.pushReplacementNamed(
              context, 
              tipoNoBanco == 'coordenador' ? 'Projeto' : 'home_bolsista'
            );
          }
        } else {
          // Se o tipo não bater, desloga o usuário por segurança
          await FirebaseAuth.instance.signOut();
          _mostrarErro("Acesso negado: Você não é um ${widget.tipoUsuario}.");
        }
      } else {
        _mostrarErro("Usuário não encontrado no banco de dados.");
      }

    } on FirebaseAuthException catch (e) {
      _mostrarErro("E-mail ou senha incorretos.");
    } finally {
      if (mounted) setState(() => _estaCarregando = false);
    }
  }
}
void _mostrarErro(String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating, // Faz a barra "flutuar" na tela
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
}