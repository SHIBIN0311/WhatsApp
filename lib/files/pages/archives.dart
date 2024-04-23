import 'package:flutter/material.dart';
import 'package:whatsapp/database/database.dart';
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/core/sized_boxs.dart';


class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackGrey,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
        ),
        title: const Text('Archived',
            style: TextStyle(color: kWhite, fontSize: 20)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: kWhite,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Text(
                'These chats stay archived when new messages are received. Tap to change',
                style: TextStyle(color: kGrey),
              ),
            ),
            const Divider(
              color: kBlackGrey,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(database[index]['dp']),
                  ),
                  title: Text(database[index]['name'],
                      style: const TextStyle(color: kWhite)),
                  subtitle: Text(database[index]['recentMessage'],
                      style: const TextStyle(color: kGrey)),
                  trailing: const Text('17:57', style: TextStyle(color: kGrey)),
                  minVerticalPadding: 25,
                );
              },
              itemCount: database.length,
            ),
            const Divider(
              color: kBlackGrey,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 15, color: kGrey),
                kWidth10,
                Text('Your personal messages are',
                    style: TextStyle(
                        color: kGrey, fontSize: 11, letterSpacing: 1)),
                Text(' end-to-end encrypted',
                    style: TextStyle(
                        color: kGreen, fontSize: 11, letterSpacing: 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
