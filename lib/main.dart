import 'dart:ui';

import 'package:balance_project/config/colors/static_colors.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 0;
  @override
  void initState() {
    super.initState();

  }

  CurvedNavigationBarItem _buildCurvedNavigationBarItem(IconData icon, String label) {
    return CurvedNavigationBarItem(
      child: Icon(icon,color: Colors.white,),
      label: label,
      labelStyle: TextStyle(color: Colors.white,fontSize: 10.sp),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        color: StaticColors.themeColor,
        buttonBackgroundColor: StaticColors.themeColor.withOpacity(0.8),

        items: [
          _buildCurvedNavigationBarItem(Icons.home_outlined, 'Home'),
          _buildCurvedNavigationBarItem(Icons.search, 'Search'),
          _buildCurvedNavigationBarItem(Icons.chat_bubble_outline, 'Chat'),
          _buildCurvedNavigationBarItem(Icons.newspaper, 'Feed'),
          _buildCurvedNavigationBarItem(Icons.perm_identity, 'Personal'),

        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_page',

            ),
          ],
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
