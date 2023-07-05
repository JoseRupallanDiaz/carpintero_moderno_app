import 'dart:convert';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:el_carpintero_moderno_app/app/pages/new_post/new_post_controller.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:el_carpintero_moderno_app/data/remote/post_remote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class NewPostView extends View {
  const NewPostView({super.key});

  @override
  State<NewPostView> createState() => _NewPostViewState();
}

class _NewPostViewState extends ViewState<NewPostView, NewPostController> {
  _NewPostViewState()
      : super(NewPostController(PostRemoteRepository(), UserLocalRepository()));

  @override
  Widget get view {
    return ControlledWidgetBuilder<NewPostController>(
      builder: ((context, controller) => Scaffold(
            key: globalKey,
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Título",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.titleInput,
                      decoration: const InputDecoration(
                        hintText: "Mi Proyecto",
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Portada",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: controller.pickImage,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              BootstrapIcons.upload,
                              size: 40,
                            ),
                            const SizedBox(height: 10),
                            const Text("Subir imagen"),
                            (controller.pickedFile != null)
                                ? Text(
                                    controller.pickedFile!.name,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Dificultad",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField(
                      value: controller.difficultyIndex,
                      items: controller.getDifficultyList(),
                      onChanged: (e) => controller.selectDifficulty(e),
                      isExpanded: true,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Herramientas",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: controller.toolInput,
                            decoration: const InputDecoration(
                                label: Text("Agregar Herramienta")),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              iconSize: 30,
                              onPressed: controller.addTool,
                              icon: const Icon(
                                BootstrapIcons.plus_circle_fill,
                                color: AppTheme.buttonHighlight,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.navbarBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: controller.getListWidget(controller.tools),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    Text(
                      "Materiales",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: controller.materialsInput,
                            decoration: const InputDecoration(
                                label: Text("Agregar Material")),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              iconSize: 30,
                              onPressed: controller.addMaterial,
                              icon: const Icon(
                                BootstrapIcons.plus_circle_fill,
                                color: AppTheme.buttonHighlight,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: AppTheme.navbarBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children:
                            controller.getListWidget(controller.materials),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Descripción",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: controller.descriptionInput,
                      decoration: const InputDecoration(
                        hintText: "Proyecto casero facil de realizar.",
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.newPost(context);
                        },
                        child: const Text("Guardar"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
