import 'package:flutter/material.dart';
import 'package:whatsapp/database/database.dart';
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/core/sized_boxs.dart';
import 'package:whatsapp/files/custom_widgets/app_bar_widget1.dart';
import 'package:whatsapp/files/pages/audio_calls.dart';


class CallScreen extends StatelessWidget {
  const CallScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgetOne(title: 'Calls',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight10,
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/128/9762/9762302.png',
                  width: 30,
                  height: 30,
                ),
              ),
              title: const Text(
                'Create call Links',
                style: TextStyle(fontSize: 16, color: kWhite),
              ),
              subtitle: const Text(
                'Share a link for your WhatsApp call',
                style: TextStyle(fontSize: 12, color: kGrey, letterSpacing: 1),
              ),
            ),
            kHeight10,
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Recent',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kWhite,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            kHeight10,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: database.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  minVerticalPadding: 25,
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(database[index]['dp']),
                  ),
                  title: Text(
                    database[index]['name'],
                    style: const TextStyle(
                      color: kWhite,
                    ),
                  ),
                  subtitle: const Text(
                    '12:34 PM',
                    style: TextStyle(color: kGrey),
                  ),
                  trailing: IconButton(
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => AudioCall(
                          name: database[index]['name'],
                          image: database[index]['dp'],
                        ),
                      ),
                      (route) => true,
                    ),
                    icon: const Icon(Icons.call),
                    color: kTeal,
                    iconSize: 30,
                  ),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add_call,
          color: kBlack,
        ),
      ),
    );
  }
}
