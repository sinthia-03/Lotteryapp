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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.white),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        automaticallyImplyLeading:widget.showBackButton,

      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: widget.gradientColors ?? AppColors.primaryGradient,
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        ),
      ),
        child:widget.body,
      ),

    );
  }
}
