import 'package:flutter/material.dart';

class MyCustomerPage extends StatefulWidget{
  _MyCustomerPageState createState() => _MyCustomerPageState();
}

class _MyCustomerPageState extends State<MyCustomerPage>{
  int _currentIndex = 0;

  final tabs =[
    Center(child: Text('Home')),
    Center(child: Text('Orders')),
    Center(child: Text('Profile')),
    Center(child: Text('Wallet')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Page"),
      ),
      body:
      tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              title: Text('Orders'),
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text('Wallet'),
              backgroundColor: Colors.orange
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Viraj Shah"),
              accountEmail: Text("viraj.s.imca16@ahduni.edu.in"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "V",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),title: Text("My Account"),
              onTap:() {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.event),title: Text("My Subscriptions"),
              onTap:() {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.shop),title: Text("Shop By Category"),
              onTap:() {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.share),title: Text("Share"),
              onTap:() {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),title: Text("Logout"),
              onTap:() {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

}