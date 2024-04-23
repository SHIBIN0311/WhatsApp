import 'package:flutter/material.dart';
import 'package:whatsapp/database/database.dart';
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/core/sized_boxs.dart';
import 'package:whatsapp/files/custom_widgets/app_bar_widget1.dart';
import 'package:whatsapp/files/pages/archives.dart';
import 'package:whatsapp/files/pages/person_screen.dart';
import 'package:whatsapp/files/pages/select_contact.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidgetOne(
              title: 'WhatsApp',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, color: kWhite),
            ),
            Container(
              color: kBlack,
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ArchivedScreen(),
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.archive_outlined,
                        color: kGrey,
                      ),
                      kWidth10,
                      Text('Archived', style: TextStyle(color: kWhite)),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonalChat(index: index,
                          
                        ),
                      ));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundImage: NetworkImage(database[index]['dp']),
                    ),
                    title: Text(database[index]['name'],
                        style: const TextStyle(color: kWhite)),
                    subtitle: Text(database[index]['recentMessage'],
                        style: const TextStyle(color: kGrey)),
                    trailing:
                        const Text('17:57', style: TextStyle(color: kGrey)),
                    minVerticalPadding: 20,
                  );
                },
                itemCount: database.length),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SelectContact(),
        )),
        child: const Icon(
          Icons.message,
          color: kBlack,
        ),
      ),
    );
  }
}
