import 'package:flutter/material.dart';
import 'package:kura/src/blocs/bloc_provider.dart';
import 'package:kura/src/utils/codes.dart';
import 'package:kura/src/utils/color.dart';
import 'package:kura/src/utils/consts.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    final _profileImage = CircleAvatar(
      backgroundColor: Colors.white70,
      child: Text(
        'ML',
        style: TextStyle(color: COLOR_PRIMARY),
      ),
    );

    _buildDraweItem(IconData icon, NavItem selectedItem) => IconButton(
          icon: Icon(icon),
          color: Colors.white,
          onPressed: () => bloc.selectedPage.add(selectedItem),
        );

    final _drawer = Material(
        color: COLOR_PRIMARY,
        elevation: 4.0,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _profileImage,
                _buildDraweItem(Icons.home, NavItem.home),
                _buildDraweItem(Icons.add_circle, NavItem.addQuestion),
                _buildDraweItem(Icons.view_day, NavItem.myQuestions),
                _buildDraweItem(Icons.bookmark, NavItem.bookmarks),
                _buildDraweItem(Icons.lightbulb_outline, NavItem.recommendations),
                Spacer(),
                _buildDraweItem(Icons.help, NavItem.help),
                _buildDraweItem(Icons.info, NavItem.info),
              ],
            )));
    return _drawer;
  }
}
