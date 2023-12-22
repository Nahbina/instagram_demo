import 'package:flutter/material.dart';

class PostFeed extends StatefulWidget {
  @override
  _PostFeedState createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> with TickerProviderStateMixin {
  bool isLiked = false;
  bool isBookmarked = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack, // Use a bounce curve
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleLikeButtonTap() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        _animationController.forward(from: 0.0);
      } else {
        _animationController.reverse();
      }
    });
    print('Like button pressed!');
  }

  void _handleBookmarkButtonTap() {
    setState(() {
      isBookmarked = !isBookmarked;
      if (isBookmarked) {
        _animationController.forward(from: 0.0);
      } else {
        _animationController.reverse();
      }
    });
    print('Bookmark button pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/8.png'),
            ),
            title: Text('Bella'),
            subtitle: Text('Graphics Designer'),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/images/graphicsdesign.png'),
              ),
              Positioned(
                top: 30,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: _handleBookmarkButtonTap,
                    splashColor: Colors.transparent,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: IconButton(
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: isBookmarked ? Colors.white : Colors.white,
                            ),
                            onPressed: _handleBookmarkButtonTap,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Bella',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' Designing is what I love',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(left: 26),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/5.png'),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/6.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text('+48 other liked'),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: _handleLikeButtonTap,
                            splashColor: Colors.transparent,
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _animation.value,
                                  child: IconButton(
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked ? Colors.red : null,
                                    ),
                                    onPressed: _handleLikeButtonTap,
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage('assets/images/football.png'),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Add comment.....\nView comment',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/7.png'),
            ),
            title: Text('Nick'),
            subtitle: Text('Professional Football Player'),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/images/football.png'),
              ),
              Positioned(
                top: 30,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: _handleBookmarkButtonTap,
                    splashColor: Colors.transparent,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: IconButton(
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: isBookmarked ? Colors.white : Colors.white,
                            ),
                            onPressed: _handleBookmarkButtonTap,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Nick',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' I cant keep calm when football on',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(left: 26),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/5.png'),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/6.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text('+48 other liked'),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: _handleLikeButtonTap,
                            splashColor: Colors.transparent,
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _animation.value,
                                  child: IconButton(
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked ? Colors.red : null,
                                    ),
                                    onPressed: _handleLikeButtonTap,
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage('assets/images/s2.png'),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Add comment.....\nView comment',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/5.png'),
            ),
            title: Text('Alexa'),
            subtitle: Text('Solivagant'),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/images/graphicsdesign.png'),
              ),
              Positioned(
                top: 30,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: _handleBookmarkButtonTap,
                    splashColor: Colors.transparent,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: IconButton(
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: isBookmarked ? Colors.white : Colors.white,
                            ),
                            onPressed: _handleBookmarkButtonTap,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Alexa ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '"Find a beautiful place, and get lost."',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(left: 26),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/5.png'),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/6.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text('+48 other liked'),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: _handleLikeButtonTap,
                            splashColor: Colors.transparent,
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _animation.value,
                                  child: IconButton(
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked ? Colors.red : null,
                                    ),
                                    onPressed: _handleLikeButtonTap,
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                      radius: 18.0,
                      backgroundImage: AssetImage('assets/images/football.png'),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Add comment.....\nView comment',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}
