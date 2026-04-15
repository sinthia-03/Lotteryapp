import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_string.dart';
import 'package:lottery_app/pesentation/widget/gradient_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(title: AppStrings.homeTitle,

        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.homeTagline),
              Text(AppStrings.homeEmoji),
              ElevatedButton(onPressed: (){},
                  child: Text(AppStrings.playLotteryAction),
              )
            ],
          ),
        ),
    );
  }
}
