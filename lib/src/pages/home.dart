import 'package:flutter/material.dart';
import 'package:kura/src/utils/color.dart';
import 'package:kura/src/utils/consts.dart';
import 'package:kura/src/views/drawer.dart';
import 'package:kura/src/views/main_view.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: COLOR_BACKGROUND,
      
      body: SafeArea(
              child: Row(
          children: <Widget>[
            DrawerView(),
            Expanded(
              child: MainView(),
            )
          ],
        ),
      ),
    );
  }
}
