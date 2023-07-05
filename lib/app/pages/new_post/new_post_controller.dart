import 'dart:io';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:el_carpintero_moderno_app/app/pages/new_post/new_post_presenter.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:el_carpintero_moderno_app/app/widgets/snackbar.dart';
import 'package:el_carpintero_moderno_app/domain/entities/difficulty.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_local_user_usecase.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/new_post_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/entities/post.dart';

class NewPostController extends Controller {
  NewPostPresenter newPostPresenter;
  bool isLoading = false;
  List<String> difficulty = Difficulty.list;
  int difficultyIndex = 0;
  List<String> tools = [];
  List<String> materials = [];
  TextEditingController toolInput = TextEditingController();
  TextEditingController materialsInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();
  Post? post;
  String? token;
  final _picker = ImagePicker();
  File? _image;
  XFile? _pickedFile;

  NewPostController(
      PostRepository postRepository, UserRepository userRepository)
      : newPostPresenter = NewPostPresenter(postRepository, userRepository);

  @override
  void onInitState() {
    super.onInitState();
    newPostPresenter.getLocalUser();
  }

  @override
  void initListeners() {
    newPostPresenter.newPostOnComplete = () {};
    newPostPresenter.newPostOnError = () {};
    newPostPresenter.newPostOnNext = newPostOnNext;

    newPostPresenter.getUserOnComplete = () {};
    newPostPresenter.getUserOnError = (e) {};
    newPostPresenter.getUserOnNext = getUserOnNext;
  }

  void getUserOnNext(GetLocalUserUseCaseResponse response) {
    token = response.user!.token;
  }

  void newPostOnNext(NewPostResponse response) {
    isLoading = false;
    print(response.id);
    refreshUI();
    ScaffoldMessenger.of(response.context)
        .showSnackBar(appSnackBar("Publicación creada"));
  }

  void newPost(BuildContext context) {
    isLoading = true;
    refreshUI();
    Post post = Post(
      title: titleInput.text,
      difficulty: difficultyIndex,
      materials: materials,
      tools: tools,
      description: descriptionInput.text,
    );
    if (_image != null && token != null) {
      newPostPresenter.newPost(post, token!, context, _image!);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(appSnackBar("Hubo un problema."));
    }
  }

  List<DropdownMenuItem> getDifficultyList() {
    List<DropdownMenuItem> list = [];
    for (int i = 0; i < difficulty.length; i++) {
      list.add(DropdownMenuItem(
        value: i,
        child: Text(difficulty[i]),
      ));
    }
    return list;
  }

  List<Widget> getListWidget(List<String> list) {
    List<Widget> widgetList = [];
    for (int i = 0; i < list.length; i++) {
      widgetList.add(Row(children: [
        Expanded(child: Text(list[i])),
        IconButton(
          onPressed: () {
            list.removeAt(i);
            refreshUI();
          },
          icon: const Icon(
            BootstrapIcons.dash,
            color: AppTheme.buttonHighlight,
          ),
        )
      ]));
    }
    return widgetList;
  }

  void selectDifficulty(value) {
    difficultyIndex = value;
    refreshUI();
  }

  void addTool() {
    if (toolInput.text != "") {
      tools.add(toolInput.text);
      toolInput.text = "";
      refreshUI();
    }
  }

  void addMaterial() {
    if (materialsInput.text != "") {
      materials.add(materialsInput.text);
      materialsInput.text = "";
      refreshUI();
    }
  }

  Future<void> pickImage() async {
    _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      _image = File(_pickedFile!.path);
    }
  }
}
