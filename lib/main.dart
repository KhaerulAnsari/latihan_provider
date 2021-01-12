import 'package:flutter/material.dart';
import 'package:latihan_provider/cart.dart';
import 'package:latihan_provider/money.dart';
import 'package:provider/provider.dart';
import 'package:latihan_provider/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Provider"),
          backgroundColor: Colors.pink[100],
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<Money>(
              builder: (context) => Money(),
            ),
            ChangeNotifierProvider<Cart>(
              builder: (context) => Cart(),
            ),
          ],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sisa Uang : ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Consumer<Money>(
                        builder: (context, money, _) => Text(
                          money.balance.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 500,
                      width: 300,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 300,
                              height: 150,
                              child: Image.asset(
                                'assets/images/bag.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                "Tas Gucci",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Tas gucci dengan warna pink anda boleh bebas memilih warna,jangan sampai kehabisan untuk memiliki tas tersebut stok terbatas",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Rp 150.000",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 80,
                                      child: Card(
                                        color: Colors.pink[100],
                                        child: Center(
                                          child: Consumer<Cart>(
                                            builder: (context, cart, _) => Text(
                                                cart.quality.toString(),
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 45,
                              width: 300,
                              child: Consumer<Money>(
                                builder: (context, money, _) => Consumer<Cart>(
                                  builder: (context, cart, _) => RaisedButton(
                                    color: Colors.pink[100],
                                    onPressed: () {
                                      if (money.balance >= 150000) {
                                        cart.quality += 1;
                                        money.balance -= 150000;
                                      }
                                    },
                                    child: Text("Tambah Barang",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.pink[100],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "total Belanjaan : ",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Consumer<Cart>(
                                    builder: (context, cart, _) => Text(
                                      cart.quality.toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
