import 'package:balance_project/core/base_pages/base_stateless_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends BaseStatelessPage {
  const SearchPage({super.key});

  @override
  bool containPadding() => false;

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text("Search Page"),
    );
  }
}
