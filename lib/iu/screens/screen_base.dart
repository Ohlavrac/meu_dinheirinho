import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';
import 'package:meu_dinheirinho/iu/screens/wallet/wallet.dart';

class ScreenBase extends StatefulWidget {
  const ScreenBase({Key? key}) : super(key: key);

  @override
  State<ScreenBase> createState() => _ScreenBaseState();
}

class _ScreenBaseState extends State<ScreenBase> {

  int _selectedIndex = 0;
  static const  List<Widget> _screensList = [
    Wallet(),
    Wallet(),
    Wallet(),
    Wallet(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: _screensList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet, color: AppColors.textBlack,),
            label: "",
            backgroundColor: AppColors.primary
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month, color: AppColors.textBlack,),
            label: "",
            backgroundColor: AppColors.primary
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: AppColors.textBlack,),
            label: "",
            backgroundColor: AppColors.primary
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: AppColors.textBlack,),
            label: "",
            backgroundColor: AppColors.primary
          ),
          
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem
      ),
    );
  }
}