import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessPage extends StatelessWidget with BasePageMixin {
  const BaseStatelessPage({super.key});

  @override
  Widget? bottomSheet() => null;

  @override
  Widget? backgroundImage() => null;

  @override
  PreferredSizeWidget? appBar() => null;

  @override
  Widget? appbarWidget() => null;

  @override
  bool containPadding() => true;

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }
}
