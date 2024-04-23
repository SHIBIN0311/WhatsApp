
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whatsapp/database/database.dart';
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/pages/audio_calls.dart';

class PersonalChat extends StatefulWidget {
  final int index;

  const PersonalChat({super.key, required this.index});

  @override
  PersonalChatState createState() => PersonalChatState();
}

class PersonalChatState extends State<PersonalChat> {
  List<String> messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    final box = await Hive.openBox<List<String>>('messages_box');
    messages = List<String>.from(box.get(widget.index.toString()) ?? []);
    setState(() {});
  }

  void _sendMessage(String message) async {
    if (message.isNotEmpty) {
      messages.add(message);
      _textEditingController.clear();

      final box = await Hive.openBox<List<String>>('messages_box');
      box.put(widget.index.toString(), messages);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
        ),
        backgroundColor: kBlackGrey,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(database[widget.index]["dp"]),
              radius: 20,
            ),
            const SizedBox(width: 8.0),
            Text(
              database[widget.index]["name"],
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam, color: Colors.white),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => AudioCall(
                  name: database[widget.index]['name'],
                  image: database[widget.index]['dp'],
                ),
              ),
              (route) => true,
            ),
            icon: const Icon(Icons.call, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(messages[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      style: const TextStyle(color: kWhite),
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_file_rounded),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_money),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 25,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.white,
                    onPressed: () {
                      _sendMessage(_textEditingController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
