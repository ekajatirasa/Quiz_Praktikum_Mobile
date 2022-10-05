import 'package:flutter/material.dart';
import 'package:quiz_prak_mobile/groceries.dart';
import 'package:url_launcher/url_launcher.dart';

class GroceriesList extends StatefulWidget {
  final int groceriesIdx;

  const GroceriesList({Key? key, required this.groceriesIdx}) : super(key: key);

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  @override
  bool toggle = false;

  Widget build(BuildContext context) {
    final Groceries groceries = groceryList[widget.groceriesIdx];
    return Scaffold(
        appBar: AppBar(
          title: Text(groceries.name),
          backgroundColor: Colors.green,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                icon:
                    toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () async {
                    if (!await launch(groceries.productUrl))
                      throw 'Could not launch ${groceries.productUrl}';
                  }),
            )
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(
                        groceries.productImageUrls[0],
                        width: 300,
                      ),
                    ),
                    Text(
                      groceries.storeName,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold,  color: Colors.green),
                    ),
                    Text(
                      groceries.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Stock ${groceries.stock} | Harga: ${groceries.price}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Diskon ${groceries.discount} | Review Average: ${groceries.reviewAverage}\n",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Deskripsi Produk: \n${groceries.description}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          "# |",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          "Detail Gambar",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                    child: SizedBox(height: 400, child: _build_songlist())),
              )
            ],
          )
        ]));
  }

  Widget _build_songlist() {
    final Groceries groceries_list = groceryList[widget.groceriesIdx];
    return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("${index + 1} |"),
                    title: Image.network(
                      groceries_list.productImageUrls[index],
                      width: 250,
                      height: 250,
                    ),

                  )
                ],
              ),

            )),
          );
        },
        itemCount: groceries_list.productImageUrls.length);
  }
}
