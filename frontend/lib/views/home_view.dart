import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // final int _selectedLength = 10;
  final List<bool> _selected = List.generate(10, (index) => false);

  /*
  @override
  void initState(){
    super.initState();
      _selected = List.generate(_selectedLength, (index) => false);
  }
  */

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleButton(int index) {
    setState(() {
      _selected[index] = !_selected[index];
    });
  }

  int currentNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
      body: Column(
        children: [

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.blue,
                      )
                  ),
                ),

                Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                        // ボタンが押された時の処理
                        // print('Button $index pressed'),
                        _toggleButton(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selected[index] ? Colors.green : null,
                        ),
                        child: Text('Button $index'),
                      ),
                    );
                  }),
                  // ;
                ),



              ],
            ),

          ),


          // トーク部分
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('機械学習'),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Text(
                    '15',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Hot Topics 部分
          Expanded(
            child: ListView(
              children: [
                HotTopicWidget(title: 'A Distributed...', views: 1500),
                HotTopicWidget(title: 'Byzantine...', views: 228),
              ],
            ),
          ),
        ],
      ),

      // ボトムナビゲーションバー
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HotTopicWidget extends StatelessWidget {
  final String title;
  final int views;

  HotTopicWidget({required this.title, required this.views});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(
            children: [
              Icon(Icons.remove_red_eye),
              SizedBox(width: 5),
              Text('$views'),
            ],
          ),
        ],
      ),
    );
  }
}