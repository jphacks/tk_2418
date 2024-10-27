import 'package:flutter/material.dart';
// import 'package:provider/provider.dart'; //ToDO: ここにViewModelを通して値の流し込みを行う

// import '../viewmodels/talk_viewmodel.dart'; //ToDO: ここにViewModelを通して値の流し込みを行う

class CommunityView extends StatefulWidget {
  const CommunityView({Key? key}) : super(key: key);

  @override
  _CommunityViewState createState() => _CommunityViewState();
}
class _CommunityViewState extends State<CommunityView> {
  final TextEditingController messageController = TextEditingController();
  int _selectedIndex = 0;
  final List<bool> _selected = List.generate(10, (index) => false);
  final List<String> _items = [
    "機械学習",
    "連合学習",
    "LiDAR",
    "P2P",
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

  @override
  Widget build(BuildContext context) {
    // final communityViewModel = Provider.of<CommunityViewModel>(context);//ToDO: ここにViewModelを通して値の流し込みを行う

    return Scaffold(
      appBar: AppBar(title: const Text('コミュニティ')),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    // ボタンが押された時の処理
                    onPressed: () => _toggleButton(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selected[index] ? Colors.green : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    ),

                    // チェックを入れる
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_selected[index]) ...[
                          // const SizedBox(width: 8.0),
                          const Icon(Icons.check),
                        ],
                        Text("Button $index"),
                      ],
                    ),
                  ),
                );
              }),

              //   ElevatedButton(onPressed: () {}, child: Text('連合学習')),
              // ],
            ),
          ),

          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Name'),
                  subtitle: Text('やぁ！'),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Me'),
                  subtitle: Text('ども'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'メッセージを入力...'),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'トーク'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: '文献'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'プロフィール'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
