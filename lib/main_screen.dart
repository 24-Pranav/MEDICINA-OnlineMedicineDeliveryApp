
import 'package:flutter/material.dart';
import 'package:medicina/Help.dart';
import 'package:medicina/Logout.dart';
import 'package:medicina/my_wishlist.dart';
import 'package:medicina/my_cart.dart';
import 'package:medicina/shop_by_category.dart';
import 'package:medicina/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final List<Widget> list = [
    Home(),
    Shopbycategory(),
    Mycart(),
    MyWishlist(),
    Help(),
    Logout()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation Drawer"),
      ),
      body: list[index],
      drawer: MyDrawer(
        onTap: (ctx, i) {
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.onTap});
  final Function(BuildContext, int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange[600]),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/happy.jpg')),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Hey Waruna',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Your Location- Nugegoda',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Shop by Category'),
              onTap: () => onTap(context, 1),
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('My cart'),
              onTap: () => onTap(context, 2),
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('My Wishlist'),
              onTap: () => onTap(context, 3),
            ),
            ListTile(
              leading: const Icon(Icons.help_center),
              title: const Text('Help'),
              onTap: () => onTap(context, 4),
            ),
            const Divider(
              height: 1,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () => onTap(context, 5),
            ),
          ],
        ),
      ),
    );
  }
}
