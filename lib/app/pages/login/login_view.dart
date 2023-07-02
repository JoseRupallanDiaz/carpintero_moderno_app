import 'package:el_carpintero_moderno_app/app/pages/login/login_controller.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginView extends View {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ViewState<LoginView, LoginController> {
  _LoginViewState() : super(LoginController());

  @override
  Widget get view => Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.4,
            fit: BoxFit.cover,
            image: AssetImage("assets/img/login_background.jpg"),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          "assets/img/logo.png",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: AppTheme.loginBackground,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Center(
                                  child: Text("Correo electrónico"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Center(
                                  child: Text("Contraseña"),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Iniciar sesión"),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: const Text("No tienes cuenta? Regístrate"),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 0,
                        color: AppTheme.inputBackground,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        child: const Text("Continuar como Invitado"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
