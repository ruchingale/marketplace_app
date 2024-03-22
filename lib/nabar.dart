import 'package:flutter/material.dart';
import 'profilepg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("Homechefs"),
          accountEmail: const Text("Homechef@gmail.com"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset('lib/images/image (4).png'),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.location_searching),
          title: Text('Find Homechefs near you'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.indeterminate_check_box),
          title: Text('Orders'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        )
      ],
    ));
  }
}
