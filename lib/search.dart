import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      title: Text('Search'),
    ),);
  }
}
