import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:chat_app/widgets/widgets.dart'; // Assuming this is where your custom widgets are defined

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final StreamController<SwipeRefreshState> _stateController =
      StreamController<SwipeRefreshState>.broadcast();

  // Sample data for refreshing
  List<String> _items = List.generate(10, (index) => "Message ${index + 1}");

  // Handle the refresh action
  Future<void> _onRefresh() async {
    _stateController.add(SwipeRefreshState.loading);
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _items.add("New Message ${_items.length + 1}");
    });
    _stateController.add(SwipeRefreshState.hidden);
  }

  @override
  void dispose() {
    _stateController.close(); // Close the stream when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const DrawerWidget(),
      extendBody: true,
      key: _scaffoldKey,
      backgroundColor: const Color(0xffededf7),
      body: SwipeRefresh.builder(
        stateStream: _stateController.stream,
        onRefresh: _onRefresh,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                height: 150,
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
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                        print('Drawer opened');
                      },
                      child: Image.asset(
                        'images/man2.png',
                        width: screenWidth / 6,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 40,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    SizedBox(
                      width: screenWidth / 15,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(7, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/man2.png',
                          width: screenWidth / 5,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const Divider_tool2(
                title: 'Recent Chats',
              ),
              ...List.generate(_items.length, (index) {
                return Message_tool(
                  name: 'name',
                  image: 'images/man2.png',
                  message: 'hello there',
                  date: '12/12/2024',
                );
              }),
            ],
          );
        },
        itemCount: 1, // Single item since you are rendering everything inside
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 0,
      ),
    );
  }
}
