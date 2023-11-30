import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF31496B),
        title: Text('Categories'),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => const AddProductScreen()),
                      // );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text('Add Categories'),
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
                            hintText: "Search Here....",
                          ),
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
  height: 80, // Adjusted height
  color: Color(0xFFEDECF2),
  child: ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      // Add 1 to start the categories from 1 instead of 0
      int categoryNumber = index + 1;

      return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15), // Adjusted vertical margin
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Category $categoryNumber', // Use the modified categoryNumber
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('Subtitle for Item $categoryNumber'), // Use the modified categoryNumber
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // Action to perform when tapping on the list item
            print('Tapped on Item $categoryNumber');
          },
        ),
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

