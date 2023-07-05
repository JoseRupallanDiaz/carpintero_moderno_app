import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:el_carpintero_moderno_app/app/pages/Search/Search_controller.dart';

import '../../data/mock/post_mock_repository.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchText = _searchController.text;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        cursorColor: Colors.white,
        controller: _searchController,
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
                _searchController.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}