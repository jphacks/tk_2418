import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'community_view.dart';
import 'sign_up_view.dart';

class AuthView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ID入力フィールド
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            const SizedBox(height: 10),
            // 名前入力フィールド
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: '名前'),
            ),
            const SizedBox(height: 10),
            // Email入力フィールド
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'メールアドレス'),
            ),
            const SizedBox(height: 20),
            // ログインボタン
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final name = nameController.text.trim();
                    final id = idController.text.trim();
                    if (email.isNotEmpty && name.isNotEmpty && id.isNotEmpty) {
                      authViewModel.login(id, name, email);
                      print(authViewModel.isLoggedIn);
                      if (authViewModel.isLoggedIn) {
                        // ログインが成功したらCommunityViewに遷移
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CommunityView()),
                        );
                      } else {
                        // ログイン失敗時の処理
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ログインに失敗しました')),
                        );
                      }
                    }
                  },
                  child: const Text('ログイン'),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpView()),
                      );
                    },
                    child: Text('新規登録')
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
