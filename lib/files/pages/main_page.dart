import 'package:flutter/material.dart';
import 'package:whatsapp/files/custom_widgets/bottum_navigation_bar.dart';
import 'package:whatsapp/files/pages/calls.dart';
import 'package:whatsapp/files/pages/chats_screen.dart';
import 'package:whatsapp/files/pages/communities.dart';
import 'package:whatsapp/files/pages/updates.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final pages = [
    const ChatScreen(),
    const UpDateScreen(),
    const CommunitieScreen(),
    const CallScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          }),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}





