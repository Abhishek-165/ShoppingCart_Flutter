import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/Providers/cart.dart';
import 'package:shoppingcart/screens/allpurposeflour.dart';
import 'package:shoppingcart/screens/atta_flour.dart';
import 'package:shoppingcart/screens/cart.dart';
import 'package:shoppingcart/screens/shampoo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(245, 113, 113, 1),
            leading: Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              "Groceries",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
            IconButton(icon: Consumer<Cart>(
                    builder: (_, cart, ch) => Stack(children: [
                          Icon(Icons.shopping_cart_outlined,color:Colors.white),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: -0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white),
                              alignment: Alignment.center,
                              child: Text(cart.items.length.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12)),
                            ),
                          )
                        ])),onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  CartPage()),
            );
            },),
            ],
            bottom: TabBar(
              indicatorColor: Color.fromRGBO(219, 96, 88, 1),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              
              tabs: [
                Tab(text: "Atta and Flours"),
                Tab(text: "Shampoo"),
                Tab(text: "All Purpose Flour")
              ],
            ),
          ),
          body: TabBarView(
            children: [AttaFlour(), Shampoo(), AllPurposeFlour()],
          ),
        ),
      ),
    );
  }
}
