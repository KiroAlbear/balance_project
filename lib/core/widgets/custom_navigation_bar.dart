import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../imports.dart';

class CustomNavigationBar extends StatelessWidget {
  Function(int) onTap;
  CustomNavigationBar({required this.onTap});

  CurvedNavigationBarItem _buildCurvedNavigationBarItem(
      IconData icon, String label) {
    return CurvedNavigationBarItem(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      label: label,
      labelStyle: TextStyle(color: Colors.white, fontSize: 10.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
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
        onTap(index);
      },
    );
  }
}
