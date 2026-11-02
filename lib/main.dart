import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MenuUtama(),
      debugShowCheckedModeBanner: false,
    ));

// Tampilan Menu Utama agar mudah memilih tugas
class MenuUtama extends StatelessWidget {
  const MenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Utama - Faizal Isman')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PraktikInteraktif())),
            child: Text(' Komponen Interaktif '),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PraktikTabBar())),
            child: Text(' TabBar '),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PraktikBottomNav())),
            child: Text(' BottomNavigationBar '),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PraktikDrawer())),
            child: Text(' Drawer '),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// Praktik Komponen Interaktif
// ==========================================
class PraktikInteraktif extends StatelessWidget {
  const PraktikInteraktif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interaktif - Faizal Isman')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert'),
                      content: Text('This is an alert dialog.'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Tampilkan Dialog'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('This is a SnackBar'), duration: Duration(seconds: 2)),
                );
              },
              child: Text('Tampilkan SnackBar'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      height: 200,
                      child: Column(
                        children: [
                          Text('This is a Bottom Sheet'),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('Tampilkan BottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// Praktik TabBar 
// ==========================================
class PraktikTabBar extends StatelessWidget {
  const PraktikTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar - Faizal Isman'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'Car'),
              Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
              Tab(icon: Icon(Icons.directions_boat), text: 'Boat'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Car Tab')),
            Center(child: Text('Bike Tab')),
            Center(child: Text('Boat Tab')),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// Praktik BottomNavigationBar 
// ==========================================
class PraktikBottomNav extends StatefulWidget {
  const PraktikBottomNav({super.key});

  @override
  State<PraktikBottomNav> createState() => _PraktikBottomNavState();
}

class _PraktikBottomNavState extends State<PraktikBottomNav> {  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Nav - Faizal Isman')),
      body: Center(
        child: Text('Selected index: $_currentIndex', style: TextStyle(fontSize: 20)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// ==========================================
// Praktik Drawer
// ==========================================
class PraktikDrawer extends StatelessWidget {
  const PraktikDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer - Faizal Isman')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Swipe from the left to open the drawer')),
    );
  }
}