import 'package:flutter/material.dart';
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
  void initState() {
    super.initState();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.initializeSelected();  // 初期化は一度だけ
  }
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
      body: SingleChildScrollView(
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
                    children: List.generate(homeViewModel.items.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: homeViewModel.selected[index] ? Colors.green : null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          ),

                          // ボタンが押された時の処理
                          onPressed: () => homeViewModel.toggleButton(index),

                          // チェックを入れる
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (homeViewModel.selected[index]) ...[
                                // const SizedBox(width: 8.0),
                                const Icon(Icons.check),
                              ],
                              Text(homeViewModel.items[index]),
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
                children: homeViewModel.items.map((item) {
                  return TalkTopicWidget(title: item, views: 15, homeViewModel: homeViewModel);
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
                children: homeViewModel.items.map((item) {
                  return HotTopicWidget(title: item, views: 15, homeViewModel: homeViewModel);
                }).toList(),
              ),
            ),
          ],
        ),
      ),

      // ボトムナビゲーションバー
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeViewModel.selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'トーク'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: '文献'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'プロフィール'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: (int index) {
          if (index == 1) {
            homeViewModel.navigateToCommunityView(context);
          }
        },
      ),
    );
  }
}


class TalkTopicWidget extends StatelessWidget {
  final String title;
  final int views;
  final HomeViewModel homeViewModel;
  //

  TalkTopicWidget({required this.title, required this.views, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          homeViewModel.navigateToCommunityView(context);

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

  HotTopicWidget({required this.title, required this.views, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () => homeViewModel.navigateToCommunityView(context),
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