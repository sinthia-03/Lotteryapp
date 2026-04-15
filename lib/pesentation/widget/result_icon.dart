import 'package:flutter/cupertino.dart';
import 'package:lottery_app/core/app_colors.dart';

class ResultIcon extends StatelessWidget {
  final bool isWinner;
  const ResultIcon({super.key, required this.isWinner});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteOpacity20,
        
      ),
      child: Text(isWinner ? '🎉' : '😭', style: TextStyle(fontSize: 60)),
    );
  }
}
