import 'package:flutter/material.dart';
import 'package:whatsapp/files/core/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBlack,
          selectedItemColor: kWhite,
          unselectedItemColor: kGrey,
          selectedIconTheme: const IconThemeData(color: kWhite),
          unselectedIconTheme: const IconThemeData(color: kGrey),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.update_sharp), label: 'Updates'),
            BottomNavigationBarItem(
                icon: Icon(Icons.groups_2_outlined), label: 'Communities'),
            BottomNavigationBarItem(
                icon: Icon(Icons.call_outlined), label: 'Calls'),
          ],
        );
      },
    );
  }
}
