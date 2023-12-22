import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List<Map<String, String>> _stories = [
    {'image': 'assets/images/add.png', 'name': 'My story'},
    {'image': 'assets/images/5.png', 'name': 'Nick '},
    {'image': 'assets/images/6.png', 'name': 'Alexa '},
    {'image': 'assets/images/7.png', 'name': 'Mia '},
    {'image': 'assets/images/8.png', 'name': 'Jonas'},
    {'image': 'assets/images/9.jpg', 'name': 'James'},
    {'image': 'assets/images/s1.png', 'name': 'Bredy'},
  ];

  Stories({Key? key}) : super(key: key);

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
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 3, color: Colors.pink),
                        borderRadius: BorderRadius.circular(20),
                        gradient: RadialGradient(
                          colors: [
                            Colors.purple.withOpacity(0.9),
                            Colors.purple.withOpacity(0.4),
                          ],
                        ),
                        image: DecorationImage(
                          image: AssetImage(story['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      story['name']!,
                      style: TextStyle(fontSize: 12),
                    ),
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
