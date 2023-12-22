import 'package:flutter/material.dart';

class Highlights extends StatelessWidget {
  final List<Map<String, dynamic>> _stories = [
    {'image': 'assets/images/5.png', 'icon': Icons.person},
    {'image': 'assets/images/6.png', 'icon': Icons.favorite},
    {'image': 'assets/images/7.png', 'icon': Icons.music_note},
    {'image': 'assets/images/8.png', 'icon': Icons.camera},
    {'image': 'assets/images/profile.png', 'icon': Icons.person},
    {'image': 'assets/images/10.jpg', 'icon': Icons.book},
  ];

  Highlights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _stories.map((story) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.pink),
                        color: Colors.purple[300],
                        image: DecorationImage(
                          image: AssetImage(story['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Icon(story['icon'], color: Colors.amber),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
