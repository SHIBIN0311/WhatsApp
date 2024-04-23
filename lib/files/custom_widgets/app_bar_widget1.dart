import 'package:flutter/material.dart';
import 'package:whatsapp/files/core/colors.dart';

// ignore: must_be_immutable
class AppBarWidgetOne extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidgetOne(
      {super.key,
      required this.title,
      this.style = const TextStyle(color: Colors.white)});
  String title;
  TextStyle style;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.camera_alt_outlined,
            color: kWhite,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
          color: Colors.white,
        ),
        PopupMenuButton<String>(
          color: kBlackGrey,
          iconColor: kWhite,
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                child: Text(
                  'New group',
                  style: kstyle,
                ),
              ),
              const PopupMenuItem<String>(
                child: Text(
                  'New broadcast',
                  style: kstyle,
                ),
              ),
              const PopupMenuItem<String>(
                child: Text(
                  'Linked devices',
                  style: kstyle,
                ),
              ),
              const PopupMenuItem<String>(
                child: Text(
                  'Starred massages',
                  style: kstyle,
                ),
              ),
              const PopupMenuItem<String>(
                child: Text(
                  'Payments',
                  style: kstyle,
                ),
              ),
              const PopupMenuItem<String>(
                child: Text(
                  'Settings',
                  style: kstyle,
                ),
              ),
            ];
          },
        ),
      ],
      title: Text(
        title,
        style: style,
      ),
      backgroundColor: kBlackGrey,
    );
  }
}
