import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/main/Categories.dart';
import 'package:flutter_application_1/main/Orders.dart';
import 'package:flutter_application_1/main/Products.dart';
import 'package:flutter_application_1/sec/profile.dart';
import 'package:flutter_application_1/sec/setting.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31496B),
        title: Text('Dashboard'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF31496B),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Admin!', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Good Morning', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                  )),
                   trailing: GestureDetector(
                   onTap: () {
                     Navigator.pushNamed(context, '/profile');
                   },
                   child: CircleAvatar(
                     radius: 30,
                     backgroundImage: AssetImage('assets/sislogo.png'),
                   ),
                 ),
                ),
                const SizedBox(height: 20,
                )
              ],
            ),
          ),
          
          Container(
            color: Color(0xFF31496B),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  //itemDashboard('Videos', CupertinoIcons.play_rectangle, Colors.deepOrange),
                  itemDashboard('Analytics', CupertinoIcons.graph_circle, Colors.green),
                  itemDashboard('Audience', CupertinoIcons.person_2, Colors.purple),
                  itemDashboard('Comments', CupertinoIcons.chat_bubble_2, Colors.brown),
                  itemDashboard('Revenue', CupertinoIcons.money_dollar_circle, Colors.indigo),
                  itemDashboard('About', CupertinoIcons.question_circle, Colors.blue),
                  itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
             accountName: Text('Merchant Name'),
             accountEmail: Text('merchant@email.com'),
             currentAccountPicture: CircleAvatar(
               backgroundColor: Color(0xFF31496B),
               child: GestureDetector(
                 onTap: () {
                   Navigator.pushNamed(context, '/profile');
                 },
                 child: CircleAvatar(
                   radius: 40,
                   backgroundImage: AssetImage('assets/sislogo.png'),
                 ),
               ),
             ),
             decoration: BoxDecoration(
               color: Color(0xFF31496B), // Set the background color for the header
             ),
           ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Orders()),
          ),
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Items'),
              onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => items()),
          ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Categories'),
              onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Categories()),
          ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => setting()),
          ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(title.toUpperCase(), style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}
