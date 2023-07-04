import 'package:el_carpintero_moderno_app/app/pages/login/login_controller.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:el_carpintero_moderno_app/data/remote/user_remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginView extends View {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ViewState<LoginView, LoginController> {
  _LoginViewState()
      : super(LoginController(UserRemoteRepository(), UserLocalRepository()));

  @override
  Widget get view => ControlledWidgetBuilder<LoginController>(
      builder: (context, controller) => Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                opacity: 0.4,
                fit: BoxFit.cover,
                image: AssetImage("assets/img/login_background.jpg"),
              ),
            ),
            child: Scaffold(
              key: globalKey,
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
                                  controller: controller.email,
                                  keyboardType: TextInputType.emailAddress,
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
                                  controller: controller.password,
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
                                  onPressed: controller.isLoading
                                      ? null
                                      : () {
                                          controller.login();
                                        },
                                  child: controller.isLoading
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator())
                                      : const Text("Iniciar sesión"),
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
          ));
}
