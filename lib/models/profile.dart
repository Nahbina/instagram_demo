import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/components/highlights.dart';
import 'package:instagram/components/postimg.dart';
import 'package:instagram/components/profileimg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      'btr_alice',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/images/add.svg',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 24),
                    SvgPicture.asset(
                      'assets/images/menu.svg',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
            ),
            ProfileImg(),
            Container(
              padding: const EdgeInsets.only(
                  bottom: 8), // Add vertical padding as needed
              child: const Text(
                'btr_alice',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: const Text(
                'PUBG player\n Bigreton Red Aliens',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 165, right: 140, top: 15),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xCCB4A6AA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Edit profile',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Highlights',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Highlights(),
            Container(
              height: 2000,
              child: PostImg(),
            ),
          ],
        ),
      ),
    );
  }
}
