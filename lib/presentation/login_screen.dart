import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/logic/notifier/login_notifier.dart';
import 'package:todo_list_app/presentation/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Widget _socialLoginButton(String logo, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 320,
        height: 60,
        color: Colors.grey.shade300,
        child: Row(
          children: [
            Image(
              image: AssetImage(logo),
            ),
            const SizedBox(width: 10),
            Text(text, style: AppTheme.title1),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    final _loginNotifier = Provider.of<LoginNotifier>(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: paddingTop + 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Todo List',
            style: AppTheme.title1.copyWith(fontSize: 36),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 70.w,
            width: 70.w,
            child: const RiveAnimation.asset('assets/todo.riv'),
          ),
          const SizedBox(height: 60),
          InkWell(
            onTap: () {
              _loginNotifier.loginWithGoogle();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
            },
            child: _socialLoginButton('assets/logo/google.png', '구글 로그인'),
          ),
          const SizedBox(height: 30),
          _socialLoginButton('assets/logo/facebook.png', '페이스북 로그인'),
        ],
      ),
    ));
  }
}
