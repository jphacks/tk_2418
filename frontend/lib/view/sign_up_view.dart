import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'community_view.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
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
            // 名前入力フィールド
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: '名前'),
            ),
            SizedBox(height: 10),
            // メールアドレス入力フィールド
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'メールアドレス'),
            ),
            SizedBox(height: 20),
            // 登録ボタン
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final name = nameController.text.trim();
                final id = idController.text.trim();

                if (email.isNotEmpty && name.isNotEmpty && id.isNotEmpty) {
                  await signUpViewModel.signUp(id, name, email);

                  if (signUpViewModel.isRegistered) {
                    //ToDO: 登録が成功したらHomeViewに遷移
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CommunityView()),
                    );
                  } else if (signUpViewModel.errorMessage != null) {
                    // エラーがある場合
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(signUpViewModel.errorMessage!)),
                    );
                  }
                }
              },
              child: const Text('登録'),
            ),
          ],
        ),
      ),
    );
  }
}
