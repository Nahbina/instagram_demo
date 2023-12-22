import 'package:flutter/material.dart';

class PostImg extends StatefulWidget {
  const PostImg({Key? key}) : super(key: key);

  @override
  _PostImgState createState() => _PostImgState();
}

class _PostImgState extends State<PostImg> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List of image paths
  List<String> imagePaths = [
    'assets/images/graphicsdesign.png',
    'assets/images/football.png',
    'assets/images/adventure.png',
    'assets/images/football.png',
    'assets/images/graphicsdesign.png',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.photo_album,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: imagePaths.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Bookmark Content'),
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
