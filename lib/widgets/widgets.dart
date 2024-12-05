import 'dart:async';

import 'package:chat_app/pages/chat.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/login.dart';
import 'package:chat_app/pages/profile.dart';
import 'package:chat_app/pages/settings.dart';
import 'package:chat_app/pages/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class InputFields extends StatelessWidget {
  final Icon icon;
  final String labeltext;
  final FocusNode? focusNode; // Add FocusNode parameter
// input fields class --------------------------------------------------------------------------------------------------
  const InputFields({
    Key? key,
    required this.icon,
    required this.labeltext,
    this.focusNode, // Initialize focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
      child: TextField(
        focusNode: focusNode, // Attach the focusNode to the TextField
        decoration: InputDecoration(
          prefixIcon: icon,
          labelText: labeltext,
          labelStyle: TextStyle(
            color: Color(0xffc1c2e0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffc1c2e0),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff7129c9)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class Divider_tool extends StatelessWidget {
  const Divider_tool({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Color(0xffc1c2e0), // Line color
              thickness: 1, // Line thickness
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'OR',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xffc1c2e0),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Color(0xffc1c2e0), // Line color
              thickness: 1, // Line thickness
            ),
          ),
        ],
      ),
    );
  }
}

// titles class -----------------------------------------------------------------------------------------------------
class Divider_tool2 extends StatelessWidget {
  final String title;
  const Divider_tool2({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xffc1c2e0),
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Color(0xffc1c2e0), // Line color
              thickness: 1, // Line thickness
            ),
          ),
        ],
      ),
    );
  }
}

// message card class ----------------------------------------------------------------------------------------
class Message_tool extends StatelessWidget {
  final String name;
  final String image;
  final String message;
  final String date;
  const Message_tool(
      {required this.name,
      required this.image,
      required this.message,
      required this.date,
      super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // Navigate to chat screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: screenHeight / 10,
        decoration: const BoxDecoration(
            color: Color(0xffededf7),
            border: Border(bottom: BorderSide(color: Color(0xffc1c2e0)))),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth / 2.5,
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

//nav bar class ----------------------------------------------------------------------------------------------------

class NavBar extends StatefulWidget {
  final int selectedIndex; // Required integer for the selected index

  const NavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; // Initialize with the passed value
  }

  // Navigate to a specific page
  void _navigateToPage(int index) {
    setState(() {
      _selectedIndex = index; // Update active tab
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StatusPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: screenHeight / 12,
      decoration: const BoxDecoration(
          color: Color(0xffededf7),
          boxShadow: [
            BoxShadow(
              color: Color(0xffc1c2e0),
              offset: Offset(-2, 3),
              blurRadius: 15,
              blurStyle: BlurStyle.normal,
            )
          ],
          borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
          border: Border(bottom: BorderSide(color: Color(0xffc1c2e0)))),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: GNav(
          gap: 8,
          padding: const EdgeInsets.all(15),
          activeColor: const Color(0xffededf7),
          tabBackgroundColor: Color.fromARGB(255, 113, 41, 201),
          color: const Color(0xff7129c9),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.group,
              text: 'community',
            ),
            GButton(
              icon: Icons.comment_outlined,
              text: 'status',
            )
          ],
          selectedIndex: _selectedIndex, // Set the active tab
          onTabChange: _navigateToPage,
        ),
      ),
    );
  }
}

// drawer widget class ---------------------------------------------------------------------------------------
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove default padding
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xff7129c9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('images/man2.png'), // Example profile image
                ),
                SizedBox(height: 10),
                Text(
                  'mohamed abd elghany',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'elghani888@gmail.com',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Navigate or perform action
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  )); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate or perform action
              // Navigate or perform action
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  )); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Perform logout
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  )); // Close the drawer// Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
// swipe refresh widget class --------------------------------------------------------------------------------------

class SwipeRefreshWidget extends StatefulWidget {
  const SwipeRefreshWidget({super.key});

  @override
  _SwipeRefreshWidgetState createState() => _SwipeRefreshWidgetState();
}

class _SwipeRefreshWidgetState extends State<SwipeRefreshWidget> {
  final StreamController<SwipeRefreshState> _stateController =
      StreamController<SwipeRefreshState>.broadcast();
  final List<String> _items = List.generate(10, (index) => "Item ${index + 1}");

  Future<void> _onRefresh() async {
    _stateController.add(SwipeRefreshState.loading); // Set to loading state
    await Future.delayed(const Duration(seconds: 2)); // Simulate network call
    setState(() {
      _items.add("New Item ${_items.length + 1}");
    });
    _stateController.add(SwipeRefreshState.hidden); // Hide refresh indicator
  }

  @override
  void dispose() {
    _stateController.close(); // Close the stream when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SwipeRefresh.builder(
      stateStream: _stateController.stream, // Provide the required stateStream
      onRefresh: _onRefresh, // Refresh callback
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_items[index]),
          ),
        );
      },
      itemCount: _items.length,
    );
  }
}
