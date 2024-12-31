part of 'base_page_mixin.dart';

sealed class BasePage {
  Widget? appbarWidget();

  Widget? bottomSheet();

  PreferredSizeWidget? appBar();

  bool containPadding();

  Widget body(BuildContext context);

  // bool isMainPage();
}
