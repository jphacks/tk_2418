import 'package:flutter/material.dart';
import 'package:frontend/viewmodels/talk_viewmodel.dart';
import 'package:provider/provider.dart';
import 'viewmodels/auth_viewmodel.dart';
// import 'frontend/views/home_view.dart';
import 'view/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CommunityViewModel()),
      ],
      child: MaterialApp(
        title: 'Login Example',
        home: AuthCheck(),
      ),
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    // ログイン状態に応じて、ホーム画面かログイン画面に遷移
    return authViewModel.isLoggedIn ? /*HomeView()*/AuthView() : AuthView();
  }
}
