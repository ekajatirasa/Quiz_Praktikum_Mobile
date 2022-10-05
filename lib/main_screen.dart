import 'package:flutter/material.dart';
import 'package:quiz_prak_mobile/groceries.dart';
import 'package:quiz_prak_mobile/groceries_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Belanja"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Groceries place = groceryList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GroceriesList(groceriesIdx: index);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    place.productImageUrls[0],
                    width: 200,
                  ),
                  Text(
                    place.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  color: Colors.green),
                  ),
                  Text(
                    "Harga: " + place.price,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Nama Toko: " + place.storeName,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: groceryList.length,
      ),
    );
  }
}
