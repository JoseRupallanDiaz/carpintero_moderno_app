import 'package:el_carpintero_moderno_app/app/pages/register/register_controller.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:el_carpintero_moderno_app/data/remote/user_remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegisterView extends View {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ViewState<RegisterView, RegisterController> {
  _RegisterViewState() : super(RegisterController(UserRemoteRepository()));

  @override
  Widget get view => ControlledWidgetBuilder<RegisterController>(
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
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: AppTheme.loginBackground,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.username,
                                  decoration: const InputDecoration(
                                    label: Center(
                                      child: Text("Nombre de Usuario"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: controller.email,
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
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    label: Center(
                                      child: Text("Contraseña"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: controller.verifyPassword,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    label: Center(
                                      child: Text("Confirmar Contraseña"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.register();
                                  },
                                  child: const Text("Registrarse"),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child:
                                const Text("Ya tienes cuenta? Inicia sesión"),
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
