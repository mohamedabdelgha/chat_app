import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Get the height of the screen
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffededf7),
      extendBody: true,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: screenHeight / 4,
                decoration: const BoxDecoration(
                    color: Color(0xff7129c9),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff7129c9),
                          blurRadius: 5,
                          offset: Offset(-2, 3))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/man2.png',
                      width: screenWidth / 4,
                    ),
                    SizedBox(
                      width: screenWidth / 40,
                    ),
                    Text(
                      'Mohamed Abd El-ghany',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'elghani888@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight / 30,
                left: screenWidth / 30,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffededf7),
                      size: 30,
                    )),
              )
            ],
          ),
          const Divider_tool2(title: 'Bio'),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(bottom: 8, right: 10, left: 10),
              child: Text(
                'avilable',
                style: TextStyle(fontSize: 20, color: Color(0xffc1c2e0)),
              ),
            ),
          ),
          const Divider_tool2(title: 'Phone Number'),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(bottom: 8, right: 10, left: 10),
              child: Text(
                '01007981850',
                style: TextStyle(fontSize: 20, color: Color(0xffc1c2e0)),
              ),
            ),
          ),
          const Divider_tool2(title: 'Birth Date'),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(bottom: 8, right: 10, left: 10),
              child: Text(
                '16/4/2002',
                style: TextStyle(fontSize: 20, color: Color(0xffc1c2e0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
