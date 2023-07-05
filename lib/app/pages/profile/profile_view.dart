import 'package:el_carpintero_moderno_app/app/pages/profile/profile_controller.dart';
import 'package:el_carpintero_moderno_app/app/widgets/display_counter.dart';
import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../widgets/wallet.dart';

class ProfileView extends View {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ViewState<ProfileView, ProfileController> {
  _ProfileViewState() : super(ProfileController(UserLocalRepository()));

  Widget get view => ControlledWidgetBuilder<ProfileController>(
        builder: ((context, controller) => Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              width: double.infinity,
              child: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : (controller.user != null)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 70,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.user!.username ?? "null",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DisplayCounter(
                                  label: "Publicaciones",
                                  value: controller.user!.posts.toString(),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DisplayCounter(
                                  label: "Seguidores",
                                  value: controller.user!.followers.toString(),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DisplayCounter(
                                  label: "Valoraciones",
                                  value: controller.user!.valorationProm
                                      .toString(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FullScreenDialog();
                                        },
                                      );
                                    },
                                    child: const Text(
                                      "Billetera",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.logout(context);
                                    },
                                    child: const Text(
                                      "Cerrar sesión",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                            child: const Text("Iniciar sesión"),
                          ),
                        ),
            )),
      );
}
