import 'package:el_carpintero_moderno_app/app/pages/Search/Search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/mock/post_mock_repository.dart';
import '../../styles/app_theme.dart';
import '../../widgets/SearchBar.dart';
import '../../widgets/post_widget.dart';

class Search_view extends View {
  const Search_view({super.key});

  @override
  State<Search_view> createState() => _SearchviewState();
}


class _SearchviewState extends ViewState<Search_view, SearchController> {
  _SearchviewState() : super(SearchController(PostMockRepository()));

  @override
  Widget get view {
    return ControlledWidgetBuilder<SearchController>(
      builder: ((context, controller) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                cursorColor: Colors.white,
                controller: controller.searchText,
                decoration: InputDecoration(
                  fillColor: AppTheme.buttonPrimary.withOpacity(0.7),
                  prefixIconColor:   Colors.white,
                  labelText: 'Buscar',
                  labelStyle: TextStyle(color: AppTheme.lightTextColor,fontFamily: 'Poppins',fontSize: 20),
                  prefixIcon: Icon(Icons.search,size: 30,color:  AppTheme.lightTextColor),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.filter_list_alt,color: AppTheme.lightTextColor),
                    onPressed: () {
                      setState(() {
                        controller.searchText.clear();
                      });
                    },
                  ),
                ),
                onChanged: (value) {
                  TextEditingController searchText = controller.searchText;
                  controller.search();
                },
              ),
            ),
          ),
          Expanded(
            child: MasonryGridView.builder(
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
          ),
        ],
      )),
    );
  }
}
