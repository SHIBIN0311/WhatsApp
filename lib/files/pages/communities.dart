
import 'package:flutter/material.dart';
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/core/sized_boxs.dart';

class CommunitieScreen extends StatelessWidget {
  const CommunitieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackGrey,
        title: const Text(
          'Communities',
          style: TextStyle(color: kWhite),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: kWhite,
            ),
          ),
          PopupMenuButton<String>(
            color: kBlackGrey,
            iconColor: kWhite,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              color: kBlackGrey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(10)),
                          width: 65,
                          height: 60,
                          child: const Icon(
                            Icons.groups_2,
                            color: kWhite,
                            size: 40,
                          ),
                        ),
                        const Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: kGreen,
                            child: Icon(
                              Icons.add,
                              color: kWhite,
                            ),
                          ),
                        )
                      ],
                    ),
                    kWidth10,
                    const Text(
                      "New community",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kWhite),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              height: 320,
              color: kBlackGrey,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: kBlackGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://yt3.googleusercontent.com/gizUTRt3mGlEsAEfvvLWR9PIaTAeOhXBT89pTuQ6CcrAww1tWRlcskmWVK9sahEf-KWZZ3iJCw=s900-c-k-c0x00ffffff-no-rj")),
                                borderRadius: BorderRadius.circular(10)),
                            width: 65,
                            height: 60,
                          ),
                          kWidth10,
                          const Text(
                            "Asianet news",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: kWhite),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: kBlack,
                  ),
                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 55,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 206, 243, 164),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.campaign,
                        color: kGreen,
                        size: 40,
                      ),
                    ),
                    title: const Text(
                      "Announcements",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kWhite,
                      ),
                    ),
                    subtitle: const Row(
                      children: [
                        Text(
                          "~Asianet:",
                          style: TextStyle(color: kGrey),
                        ),
                        Text(
                          " Breaking News.....",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: kGrey),
                        ),
                      ],
                    ),
                    trailing: const Column(
                      children: [
                        Text(
                          "yesterday",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: kGrey),
                        ),
                        kHeight10,
                        Icon(
                          Icons.notifications_off_rounded,
                          color: kGrey,
                        ),
                      ],
                    ),
                  ),
                  kHeight10,
                  const ListTile(
                    leading: CircleAvatar(
                      child: Image(
                          image: NetworkImage(
                              "https://yt3.googleusercontent.com/gizUTRt3mGlEsAEfvvLWR9PIaTAeOhXBT89pTuQ6CcrAww1tWRlcskmWVK9sahEf-KWZZ3iJCw=s900-c-k-c0x00ffffff-no-rj")),
                    ),
                    title: Text(
                      "Asianet News: Today",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: kWhite),
                    ),
                    subtitle: Text(
                      "~Asianet News: The Indian sta..",
                      style: TextStyle(color: kGrey),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          "yesterday",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: kGrey),
                        ),
                        kHeight10,
                        Icon(
                          Icons.notifications_off_rounded,
                          color: kGrey,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.navigate_next,
                          size: 30,
                          color: kGrey,
                        ),
                        kWidth10,
                        Text(
                          "View all",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: kGrey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
