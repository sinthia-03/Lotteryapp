import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';

class GradientScaffold extends StatefulWidget {
  const GradientScaffold({super.key,
    required this.title,
     required this.body,
     this.showBackButton = false,
    this.gradientColors});

  final String title;
  final Widget body;
  final  bool showBackButton;
  final List<Color>? gradientColors;


  @override
  State<GradientScaffold> createState() => _GradientScaffoldState();
}

class _GradientScaffoldState extends State<GradientScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
