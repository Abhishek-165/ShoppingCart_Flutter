import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/Providers/cart.dart';
import 'package:shoppingcart/screens/account.dart';
import 'package:shoppingcart/screens/cart.dart';
import 'package:shoppingcart/screens/home.dart';
import 'package:shoppingcart/screens/search.dart';
import 'package:shoppingcart/screens/shopping_cart_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(
        value: Cart(),
      ),
    ], child: MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(219, 96, 88, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: NavigationBarScreen()));
  }
}

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    SearchPage(),
    CartPage(),
    UserProfile()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          iconSize: 28,
          selectedIconTheme:
              IconThemeData(color: Color.fromRGBO(219, 96, 88, 1)),
          unselectedIconTheme:
              IconThemeData(color: Color.fromRGBO(219, 96, 88, 1)),
          currentIndex: _currentIndex,
          onTap: onTappedBar,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Consumer<Cart>(
                  builder: (_, cart, ch) => Stack(children: [
                        Icon(Icons.shopping_cart_outlined),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: -0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrange),
                            alignment: Alignment.center,
                            child: Text(cart.items.length.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        )
                      ])),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.person_outline),
            ),
          ],
        ),
      
    );
  }
}
