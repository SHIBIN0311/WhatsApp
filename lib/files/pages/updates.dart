import 'package:flutter/material.dart';
import 'package:whatsapp/database/database.dart';
import 'package:whatsapp/files/core/colors.dart';
import 'package:whatsapp/files/core/sized_boxs.dart';
import 'package:whatsapp/files/custom_widgets/app_bar_widget1.dart';


class UpDateScreen extends StatelessWidget {
  const UpDateScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgetOne(
        title: 'Updates',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            kHeight10,
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Status",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: kWhite)),
                  Icon(
                    Icons.more_vert,
                    color: kWhite,
                  )
                ],
              ),
            ),
            const ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://p1.hiclipart.com/preview/666/472/877/person-user-profile-avatar-logo-blackandwhite-symbol-circle-png-clipart.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 12,
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
              title: Text(
                'My status',
                style: kstyle,
              ),
              subtitle: Text(
                "Tap to add status updates",
                style: TextStyle(color: kGrey, letterSpacing: 1),
              ),
            ),
            kHeight10,
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Recent updates',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kGrey,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StatusView(
                      imageUrl: statusImage[index],
                      userName: database[index]['name'],
                      dpImages: database[index]['dp'],
                    ),
                  )),
                  minVerticalPadding: 25,
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(database[index]['dp']),
                  ),
                  title: Text(
                    database[index]['name'],
                    style: const TextStyle(color: kWhite),
                  ),
                  subtitle: Text(
                    "${index + 1} minuts ago",
                    style: const TextStyle(color: kGrey),
                  ),
                );
              },
              itemCount: database.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.camera_alt,
          color: kBlack,
        ),
      ),
    );
  }
}

class StatusView extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final String dpImages;
  const StatusView(
      {super.key,
      required this.imageUrl,
      required this.userName,
      required this.dpImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: kWhite,
            )),
        title: Row(
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(dpImages),
              radius: 22,
            ),
            const SizedBox(width: 8.0),
            Text(
              userName,
              style: kstyle,
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: kWhite,
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}

List<String> statusImage = [
  'https://m.media-amazon.com/images/M/MV5BMTlkMTQwZWUtNTE4Yi00MmFlLTk4MzEtYzZhNmNlMDdmNzBjXkEyXkFqcGdeQXVyMTUyMjkxNzQ2._V1_.jpg',
  "https://img.wallpapersafari.com/tablet/768/1024/77/69/Ehpv3y.jpg",
  "https://live.staticflickr.com/2890/13218433134_d7e5efb4a9.jpg",
  "https://www.enwallpaper.com/wp-content/uploads/ws-Winter-Scenery-640x1136-1-500x888.jpg",
  "https://th.bing.com/th/id/OIP.A51AWZKvWYK-Ss9jnnlIbAHaLG?w=587&h=880&rs=1&pid=ImgDetMain",
  "https://cdn.wallpapersafari.com/56/85/Xz6giP.jpg",
  "https://i.pinimg.com/originals/e6/65/d1/e665d195c3d5a66f9d4c420668e37572.jpg",
  "https://th.bing.com/th/id/OIP.j52SeexZEeUwsooT-GP5PQHaNK?&rs=1&pid=ImgDetMain",
  "https://th.bing.com/th/id/OIP.eUM4FdFFkJXXgvSzCvm56AHaNK?rs=1&pid=ImgDetMain",
];
