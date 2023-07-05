import 'dart:convert';
import 'dart:ui';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:el_carpintero_moderno_app/domain/entities/difficulty.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppTheme.containerBackground,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(post.previewImage,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Shimmer.fromColors(
                      baseColor: AppTheme.mainBackground,
                      highlightColor: AppTheme.navbarBackground,
                      child: Container(
                        color: Colors.amber,
                        height: 170,
                        width: double.infinity,
                      ));
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.buttonPrimary,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 1,
                  ),
                  child: Text(Difficulty.list[post.difficulty],
                      style: Theme.of(context).textTheme.labelSmall),
                ),
              )
            ],
          ),
          Text(
            post.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            post.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
