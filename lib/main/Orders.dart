import 'package:flutter/material.dart';
import 'package:flutter_application_1/sec/notidetail.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31496B),
        title: Text('Orders', style: TextStyle(color:Colors.white)),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 250,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Here...."),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        size: 27,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10, child: Container(
                color: Color(0xFFEDECF2), // Set the color here
              ),),
          Expanded(
child: Container(
  width: double.infinity,
  height: 50, // Adjusted height
  color: Colors.grey[200], // Background color
  child: ListView.separated(
    physics: ClampingScrollPhysics(),
    padding: EdgeInsets.all(5), // Adjusted padding
    itemCount: 10,
    itemBuilder: (context, index) {
      return Card(
        elevation: 3, // Card elevation
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Adjusted contentPadding
          leading: Container(
            height: 35, // Adjusted height
            width: 35, // Adjusted width
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("assets/noti.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'E-commerce',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12, // Adjusted font size
            ),
          ),
          subtitle: Text(
            'A new Order',
            style: TextStyle(color: Colors.black, fontSize: 10), // Adjusted font size
          ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => notidetail()),
          ),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        height: 1, // Adjusted height between items
        color: Colors.grey[400], // Adjusted color
      );
    },
  ),
),



),
        ],
      ),
    );
  }
}