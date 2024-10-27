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
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProxyProvider<AuthViewModel, HomeViewModel>(
          create: (context) => HomeViewModel(authViewModel: Provider.of<AuthViewModel>(context, listen: false)),
          update: (context, authViewModel, previousHomeViewModel) => HomeViewModel(authViewModel: authViewModel),
        ),
        ChangeNotifierProxyProvider<AuthViewModel, CommunityViewModel>(
            create: (context) => CommunityViewModel(authViewModel: Provider.of<AuthViewModel>(context, listen: false)),
            update: (context, authViewModel, previousCommunityViewModel) => CommunityViewModel(authViewModel: authViewModel),
        ),
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, authViewModel, child) {
          return MaterialApp(
            title: 'Login Example',
            initialRoute: authViewModel.isLoggedIn ? '/login' : '/login',  // ログイン状態による初期画面の動的変更
            routes: {
              '/': (context) => HomeScreen(),       // ホーム画面のルート
              '/community': (context) => CommunityView(), // コミュニティ画面のルート
              '/login': (context) => AuthView(),    // ログイン画面のルート
              '/signup': (context) => SignUpView(), // サインアップ画面のルート
            },
          );
        },
      ),
    );
  }
}
