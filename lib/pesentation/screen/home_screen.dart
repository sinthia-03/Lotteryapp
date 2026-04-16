import 'package:flutter/material.dart';
import 'package:lottery_app/core/app_colors.dart';
import 'package:lottery_app/pesentation/screen/result_screen.dart';
import 'package:provider/provider.dart';
import '../../core/app_string.dart';
import '../provider/lottery_provider.dart';
import '../widget/gradient_scaffold.dart';
import '../widget/number_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedNumber;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LotteryProvider>(context);

    return GradientScaffold(
      title: AppStrings.homeTitle,
      body: SafeArea(
        child: SingleChildScrollView( // 🔥 overflow fix
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  Icon(Icons.casino, size: 100, color: AppColors.accentCyan),

                  const SizedBox(height: 15),

                  Text(
                    AppStrings.entryHeading,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center, // ✅ fixed
                  ),

                  const SizedBox(height: 10),

                  Text(
                    AppStrings.entrySubheading,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteOpacity80,
                    ),
                    textAlign: TextAlign.center, // ✅ fixed
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(24), // ✅ fixed
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: AppColors.glassGradient,
                      ),
                      border: Border.all(
                        color: AppColors.whiteOpacity30,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackOpacity10,
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // 🔥 important
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final number = index + 1;

                        return NumberTile(
                          number: number,
                          isSelected: _selectedNumber == number,
                          onTap: () {
                            setState(() {
                              _selectedNumber = number;
                            });
                            provider.setSelectedNumber(number);
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      provider.playLottery();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultScreen(),
                        ),
                      );
                    },
                    child: Text(AppStrings.playLotteryAction),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}