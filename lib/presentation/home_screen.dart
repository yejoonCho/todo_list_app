import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/presentation/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 32),
        backgroundColor: Colors.grey.shade500,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              CircularPercentIndicator(
                percent: 0.4,
                center: Text('0.4%', style: AppTheme.title1),
                radius: 150,
                lineWidth: 10,
                animation: true,
                animationDuration: 5000,
              ),
              const SizedBox(height: 50),
              for (int i = 0; i < 20; i++)
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text('산책하기', style: AppTheme.content1),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.more_horiz),
                    ),
                  ],
                )
            ],
          )),
    );
  }
}
