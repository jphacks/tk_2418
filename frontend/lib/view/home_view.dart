import 'package:flutter/material.dart';
import 'package:frontend/view/community_view.dart';
import 'package:frontend/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

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
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // int _currentIndex = 0;
  final List<bool> _selected = List.generate(10, (index) => false);
  final List<String> _items = [
    "機械学習",
    "連合学習",
    "LiDAR",
    "P2P",
  ];

  List<String> titles = [
    "ホーム",
    "トーク",
    "文献",
    "設定"
  ];

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

  void _navigateToCommunityView() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  void _navigateToPapersView() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  int currentNumber = 0;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.person)),
        ],
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          SingleChildScrollView(
            child: Column(
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
                      children: List.generate(_items.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selected[index] ? Colors.green : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            ),

                            // ボタンが押された時の処理
                            onPressed: () => _toggleButton(index),
                            //onPressed: () => _onItemTapped(index),

                            // チェックを入れる
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_selected[index]) ...[
                                  // const SizedBox(width: 8.0),
                                  const Icon(Icons.check),
                                ],
                                Text(_items[index]),
                              ],
                            ),

                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ExpansionTile(
                  title: const Text("トーク"),
                  children: _items.map((item) {
                    return TalkTopicWidget(title: item, views: 15, homeViewModel: homeViewModel, navigate: _navigateToCommunityView);
                  }).toList(),
                ),
              ),
              //   ],
              // ),

              // Hot Topics 部分
              const Divider(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ExpansionTile(
                  title: const Text("HOT"),
                  children: _items.map((item) {
                    return HotTopicWidget(title: item, views: 15, homeViewModel: homeViewModel, navigate: _navigateToPapersView);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
          CommunityView(),
          const Center(child: Text("No Screen"),),
          const Center(child: Text("No Screen"),),
      ]),

      // ボトムナビゲーションバー
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'トーク'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: '文献'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          _onItemTapped(index);
          // if (index == 1) {
          //   homeViewModel.navigateToCommunityView(context);
          // }
        },
      ),
    );
  }
}


class TalkTopicWidget extends StatelessWidget {
  final String title;
  final int views;
  final HomeViewModel homeViewModel;
  final VoidCallback navigate;

  TalkTopicWidget({
    required this.title,
    required this.views,
    required this.homeViewModel,
    required this.navigate});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          navigate();
          //homeViewModel.navigateToCommunityView(context);
        },
        child: Container(
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
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Text(
                  views.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HotTopicWidget extends StatelessWidget {
  final String title;
  final int views;
  final HomeViewModel homeViewModel;
  final VoidCallback navigate;

  HotTopicWidget({
    required this.title,
    required this.views,
    required this.homeViewModel,
    required this.navigate});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () => navigate(),
        child: Container(
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
        ),
      ),
    );
  }
}
