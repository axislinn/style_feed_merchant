import 'package:flutter/material.dart';
import 'package:flutter_application_1/main/Categories.dart';
import 'package:flutter_application_1/main/ChatHome.dart';
import 'package:flutter_application_1/main/Dashboard.dart';
import 'package:flutter_application_1/main/Orders.dart';
import 'package:flutter_application_1/main/Products.dart';

class test extends StatefulWidget {
  const test({super.key});
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Orders(),
    items(),
    Categories(),
    dashboard(),
    ChatHome()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Orders(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
  child: Icon(Icons.dashboard, color: Colors.white),
  onPressed: () {
    setState(() {
      currentScreen = dashboard();
      currentTab = 4;
    });
  },
  backgroundColor: Color(0xFF31496B), // Default color
),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                           Orders(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.store,
                          color: currentTab == 0 ? Color(0xFF31496B) : Colors.grey,
                        ),
                        Text(
                          'Orders',
                          style: TextStyle(
                            color: currentTab == 0 ? Color(0xFF31496B) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                           items(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shop,
                          color: currentTab == 1 ? Color(0xFF31496B) : Colors.grey,
                        ),
                        Text(
                          'Items',
                          style: TextStyle(
                            color: currentTab == 1 ? Color(0xFF31496B) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Categories(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.list,
                          color: currentTab == 2 ? Color(0xFF31496B) : Colors.grey,
                        ),
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: currentTab == 2 ? Color(0xFF31496B) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ChatHome(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 3 ? Color(0xFF31496B) : Colors.grey,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                            color: currentTab == 3 ? Color(0xFF31496B) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
