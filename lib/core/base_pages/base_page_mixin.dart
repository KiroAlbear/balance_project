import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

part 'package:balance_project/core/base_pages/base_page.dart';

mixin BasePageMixin implements BasePage {
  Widget _buildWidgetTree(BuildContext context) {
    if (appBar() == null && appbarWidget() != null) {
      return Column(
        children: <Widget>[
          appbarWidget()!,
          Expanded(
            child: body(context),
          ),
        ],
      );
    } else {
      return body(context);
    }
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      bottomSheet: bottomSheet(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: containPadding() ? AppDimensions.screenPadding : 0,
        ),
        child: _buildWidgetTree(context),
      ),
    ));
  }
}
