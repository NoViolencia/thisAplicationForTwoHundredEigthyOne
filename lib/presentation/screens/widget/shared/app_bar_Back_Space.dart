import 'package:flutter/material.dart';
class AppBarBackSpace extends StatelessWidget implements PreferredSizeWidget {
  final String nombreAppBar;

  const AppBarBackSpace({
    Key? key,
    required this.nombreAppBar,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colors.primary,
      title: Text(
        nombreAppBar,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      // actions: <Widget>[
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.menu_rounded, color: Colors.white),
      //   ),
      // ],
    );
  }
}