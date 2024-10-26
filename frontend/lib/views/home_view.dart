
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
          // タグ選択部分

          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          //   child: Row(
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {},
          //         child: Text('機械学習'),
          //         style: ElevatedButton.styleFrom(
          //           // primary: Colors.lightBlueAccent, // ボタンの背景色
          //         ),
          //       ),
          //       SizedBox(width: 10),
          //       OutlinedButton(
          //         onPressed: () {},
          //         child: Text('連合学習'),
          //       ),
          //     ],
          //   ),
          // ),




          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            // height: 60,
            // child: ListView(
                // scrollDirection: Axis.horizontal,
                // children: List.generate(10, (index) {

                  // return

                    // GestureDetector(
                    // onTap: () {},
                    // child: Container(
                    //   padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black, width: 2),
                    //     // borderRadius: BorderRadius.circular(8.0),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       'Item $index'
                    //       ,style: const TextStyle(fontSize: 15),
                    //     ),
                    //   ),
                    // ),
                    // )
              children: List.generate(50, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // ボタンが押された時の処理
                      print('Button $index pressed');
                    },
                    child: Text('Button $index'),
                  ),
                );
              }),
                  // ;
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

        // height: 100,
        // child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     children: List.generate(10, (index) {
        //       return Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.blue[(index % 9 + 1) * 100],
        //         child: Center(child: Text("Item $index"),),
        //       );
        //     })
        // ),

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