import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/constants.dart';
import 'package:flutter_application_1/main/chatPage.dart';
// import '../navigationBar.dart';
import 'chatPage.dart';

class Message {
  final String text;
  final String user;

  Message(this.text, this.user);
}

class User {
  final String name;
  final String profileImage;

  User(this.name, this.profileImage);
}

class ChatHome extends StatelessWidget {
  final List<Message> messages = [
    Message("I would like to order that please", "Nan Eaint"),
    //Message("There would be two colors for that shirt, sir", "Yangoods")
    // Message("Br mote srr yin kg ma ll", "Ma Nan"),
    // Message("Laptop gyi lag ny p", "Swam Htet"),
    // Message("tay chin tl", "Swan Htet Naing"),
    // Message("Flutter nk 2 par twr", "Moe Yan"),
    // Message("X p", "Ma Thiri"),
  ];

  final List<User> users = [
    User("Nan Eaint", "assets/manan.png"),
    //User("Yangoods", "assets/pfp/yangoods.png")
    // User("Ma Nan", "assets/pfp/winter.jpg"),
    // User("Swam Htet", "assets/pfp/winter.jpg"),
    // User("Swan Htet Naing", "assets/pfp/winter.jpg"),
    // User("Moe Yan", "assets/pfp/winter.jpg"),
    // User("Ma Thiri", "assets/pfp/winter.jpg"),
  ];

  final String currentUserProfileImage = "assets/profile_image.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Messages', style: TextStyle(color: Colors.black),),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // Add the user's profile image to the top right corner
          // actions: [
          //   CircleAvatar(
          //     backgroundImage: AssetImage(currentUserProfileImage),
          //     radius: 20, // Adjust the size as needed
          //   ),
          // ],
        ),
        body: MessageList(messages: messages, users: users),
        // bottomNavigationBar: MyButtonNav()
    );
  }
}

class MessageList extends StatelessWidget {
  final List<Message> messages;
  final List<User> users;

  MessageList({required this.messages, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final user = users.firstWhere((u) => u.name == message.user);

        return InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.profileImage),
            ),
            title: Text(message.user),
            subtitle: Text(message.text),
          ),
        );
      },
    );
  }
}