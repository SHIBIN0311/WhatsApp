import 'package:flutter/material.dart';
import 'package:whatsapp/database/database.dart';
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/core/sized_boxs.dart';

class SelectContact extends StatelessWidget {
  const SelectContact({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Contact',
              style: TextStyle(
                  fontSize: 15, color: Colors.white, letterSpacing: 1),
            ),
            Title(
                color: Colors.white,
                child: const Text(
                  '10 Contact',
                  style: TextStyle(
                      fontSize: 10, color: Colors.white, letterSpacing: 1),
                ))
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: kBlackGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 2.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      kWidth10,
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.group,
                          color: Colors.white,
                        ),
                      ),
                      kWidth10,
                      Text(
                        'New Group',
                        style: TextStyle(color: kWhite),
                      )
                    ],
                  ),
                  kHeight15,
                  Row(
                    children: [
                      kWidth10,
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.contact_emergency_rounded,
                          color: Colors.white,
                        ),
                      ),
                      kWidth10,
                      Text(
                        'New Contact',
                        style: TextStyle(color: kWhite),
                      ),
                      Spacer(),
                      Icon(
                        Icons.qr_code,
                        color: kGrey,
                        size: 30,
                      ),
                      kWidth20
                    ],
                  ),
                  kHeight15,
                  Row(
                    children: [
                      kWidth10,
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.groups_2,
                          color: Colors.white,
                        ),
                      ),
                      kWidth10,
                      Text(
                        'New Community',
                        style: TextStyle(color: kWhite),
                      )
                    ],
                  ),
                  kHeight15,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Contact on whatsApp',
                          style: TextStyle(color: kGrey),
                        ),
                      )),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: database.length,
              itemBuilder: (context, index) {
                return ListTile(
                  minVerticalPadding: 25,
                  leading: CircleAvatar(
                    radius: 25,
                    foregroundImage: NetworkImage(database[index]['dp']),
                  ),
                  title: Text(
                    database[index]['name'],
                    style: const TextStyle(color: kWhite),
                  ),
                  onTap: () {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
