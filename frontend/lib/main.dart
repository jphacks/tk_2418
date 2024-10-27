import 'package:flutter/material.dart';
import 'package:frontend/view/community_view.dart';
import 'package:frontend/view/sign_up_view.dart';
import 'view/home_view.dart';
import 'viewmodels/talk_viewmodel.dart';
import 'viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'view/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CommunityViewModel()),
      ],
      child: MaterialApp(
        title: 'Login Example',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),      // ホーム画面のルート
          '/community': (context) => CommunityView(), // コミュニティ画面のルート
          '/login': (context) => AuthView(),    // ログイン画面のルート
          '/signup': (context) => SignUpView(), // サインアップ画面のルート
        },
      ),
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    // ログイン状態に応じて、ホーム画面かログイン画面に遷移
    return authViewModel.isLoggedIn ? HomeScreen() : AuthView();
  }
}
