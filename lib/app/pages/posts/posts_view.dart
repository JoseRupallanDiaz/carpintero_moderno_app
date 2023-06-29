import 'package:el_carpintero_moderno_app/app/pages/posts/posts_controller.dart';
import 'package:el_carpintero_moderno_app/app/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/mock/post_mock_repository.dart';
import '../../../domain/entities/post.dart';

class PostsView extends View {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostViewState();
}

class _PostViewState extends ViewState<PostsView, PostController> {
  _PostViewState() : super(PostController(PostMockRepository()));

  @override
  Widget get view {
    return ControlledWidgetBuilder<PostController>(
      builder: ((context, controller) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                  child: Text(
                    "Últimas Publicaciones",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                MasonryGridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.posts.length,
                  itemBuilder: ((context, index) =>
                      PostWidget(post: controller.posts[index])),
                ),
              ],
            ),
          )),
    );
  }
}
