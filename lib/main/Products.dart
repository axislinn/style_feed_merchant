import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Product.dart';
import 'package:flutter_application_1/sec/DetailScreen.dart';
import 'package:flutter_application_1/sec/add.dart';

class items extends StatefulWidget {
  const items({super.key});

  @override
  State<items> createState() => _itemsState();
}

class _itemsState extends State<items> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31496B),
        title: Text('Items'),
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
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const AddProductScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text('Add Items'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
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
          Expanded(
  child: Container(
    color: Color(0xFFEDECF2), 
    child: ListView.separated(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 1,
      itemBuilder: (context, index) {
        return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=0; i<products.length; i++)
        
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    products[i].disscount,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFEDECF2),
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                // Icon(Icons.favorite_border,
                // color: Colors.red,
                // ),
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(products[i])));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(products[i].image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                
                padding: EdgeInsets.only(bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text(products[i].title, 
                  style: TextStyle(
                  fontSize: 15,
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Container(
                
                alignment: Alignment.centerLeft,
                child: Text(products[i].name, 
                style: TextStyle(
                  fontSize: 11, color: Colors.black,
                  fontWeight: FontWeight.bold
                )),
              ),

              Padding(padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(products[i].price.toString() +" \Kyats" ,
                  style: TextStyle(fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
                  ),
                  Icon(Icons.delete,
                  color: Colors.black
                  )
                ],
              ),
              )
            ],
          ),
        )
      ],
    );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    ),
  ),
),
        ],
      ),
    );
  }
}