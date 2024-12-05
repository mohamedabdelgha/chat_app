import 'package:chat_app/widgets/widgets.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xffededf7),
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              decoration: const BoxDecoration(
                  color: Color(0xff7129c9),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff7129c9),
                        offset: Offset(-5, 2),
                        blurStyle: BlurStyle.normal,
                        blurRadius: 5),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffededf7),
                          size: 30,
                        )),
                    Text(
                      'name',
                      style: TextStyle(color: Color(0xffededf7), fontSize: 22),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.video_camera_front,
                              color: Color(0xffededf7),
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.call,
                              color: Color(0xffededf7),
                              size: 30,
                            )),
                      ],
                    )
                  ],
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height / 5),
            child: ListView(
              children: [
                BubbleNormal(
                  text: 'bubble normal with tail',
                  isSender: false,
                  color: Color.fromARGB(188, 113, 41, 201),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                BubbleNormal(
                  text: 'bubble normal with tail',
                  isSender: true,
                  color: Color(0xffc1c2e0),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              // color: Colors.amber,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc1c2e0)),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // children: [TextField()],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
