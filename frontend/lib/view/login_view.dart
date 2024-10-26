import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'community_view.dart';

class AuthView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

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
            // Email入力フィールド
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'メールアドレス'),
            ),
            const SizedBox(height: 20),
            // ログインボタン
            ElevatedButton(
              onPressed: () {
                final email = emailController.text.trim();
                if (email.isNotEmpty) {
                  authViewModel.login(email);
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
          ],
        ),
      ),
    );
  }
}
