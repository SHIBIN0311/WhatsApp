import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/pages/main_page.dart';
import 'package:whatsapp/database/message_adapter.dart';
import 'package:whatsapp/files/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(MessageListAdapter());
  await Hive.openBox<List<String>>('messages_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: kWhite,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: kTeal)
            .copyWith(background: kBlack),
      ),
      home: SplashScreen(
        child: MainScreen(),
      ),
    );
  }
}
