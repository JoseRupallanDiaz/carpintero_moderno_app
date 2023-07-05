import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:el_carpintero_moderno_app/domain/entities/step.dart'
    as poststep;
import 'package:flutter/material.dart';
import '../../../domain/entities/post.dart';

class PostDetailsView extends StatelessWidget {
  final Post post;
  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppTheme.containerBackground,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        post.previewImage,
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: AppTheme.lightTextColor,
                          iconSize: 35,
                          icon: const Icon(
                            BootstrapIcons.arrow_left,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 5)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  post.title,
                                  style: const TextStyle(
                                    color: AppTheme.lightTextColor,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      Shadow(color: Colors.black, blurRadius: 5)
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    post.rating.toString(),
                                    style: const TextStyle(
                                      color: AppTheme.lightTextColor,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black, blurRadius: 5)
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: AppTheme.lightTextColor,
                                    size: 26,
                                    shadows: [
                                      Shadow(color: Colors.black, blurRadius: 5)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: stepsWidget(post.steps, context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> stepsWidget(List<poststep.Step> steps, BuildContext context) {
  List<Widget> widgetList = [];
  for (int i = 0; i < steps.length; i++) {
    widgetList.add(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paso ${i + 1}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 5),
        Text(
          steps[i].body ?? "No body",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (steps[i].image != null) const SizedBox(height: 20),
        if (steps[i].image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              steps[i].image!,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
        if (i % 2 == 0 && i < steps.length) const Divider(),
      ],
    ));
  }
  return widgetList;
}
