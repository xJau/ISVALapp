import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/Utility/custom_search_delegate.dart';
import 'package:isval_test/routes.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HeaderState createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  static of(BuildContext context, {bool root = false}) => root
      ? context.findRootAncestorStateOfType<_HeaderState>()
      : context.findAncestorStateOfType<_HeaderState>();

}

class _HeaderState extends State<Header> {
  String _title = "ISVAL";
  String _searchText = "";
  bool _searchBar = false;

  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colorpalette.BIANCO,
      title: Text(_title, style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
      actions: [
        _searchFade(_searchBar),
        SizedBox(
          width: 10
        ),
        IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: _onPressMenuIcon,
            icon:
                Icon(Icons.menu, color: Colorpalette.AZZURRO_ISVAL, size: 40)),
        SizedBox(
          width: 20
        )
      ],
    );
  }

  void _onPressMenuIcon() {
    HapticFeedback.lightImpact();
    Navigator.of(context).pushNamed(RouteGenerator.menu);
  }

  Widget _searchIcon() {
    return IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        splashRadius: 1,
        onPressed: () {
          visibleSearchBar(true);
          HapticFeedback.lightImpact();
        },
        icon: Icon(
          Icons.search,
          color: Colorpalette.AZZURRO_ISVAL,
          size: 40,
        ));
  }

  Widget _searchFade(bool _searchBar) {
    return AnimatedCrossFade(
        firstChild: _searchIcon(),
        secondChild: _searchBox(),
        crossFadeState: _searchBar ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 500));
  }  

  Widget _searchBox() {
    return Container(
      margin: EdgeInsets.all(10),
      width: 250,
      child: TextField(
        textAlign: TextAlign.center,
        decoration:
            InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)), hintText: "search"),
        onChanged: (text) {
          this._searchText = text;
          setState(() {});
        },
      ),
    );
  }

  void visibleSearchBar(bool visible){
    setState(() {
      _searchBar = visible;
    });
  }
}
