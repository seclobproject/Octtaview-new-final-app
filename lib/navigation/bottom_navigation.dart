import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/color.dart';
import '../screens/home/home_page.dart';
import '../screens/member/member_page.dart';
import '../screens/report/rereport_page.dart';
import '../screens/wallet/wallet_page.dart';
import '../screens/withdrawal/withdrawal_page.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {


  int _selectedPageIndex = 0;

  final LinearGradient gradient = LinearGradient(
    colors: [yellow, yellow2], // Change these colors to your desired gradient
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  void callback() {
    print("callback");
  }

  final List<Map<String, Object>> _pages = [
    {'page': homepage(), 'title': 'Home'},
    {'page': membertabpage(), 'title': 'Members'},
    {'page': reportpage(), 'title': 'Report'},
    {'page': walletpage(), 'title': 'Wallet'},
    {'page': withdrawalpage(), 'title': 'Withdrawal'},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Map<String, Object> get currentPage {
    return _pages[_selectedPageIndex];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:sevensgbg,
      body: currentPage['page'] as Widget,
      bottomNavigationBar: SafeArea(
        child: Container(

          height: 90,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Set the desired border radius
            child: BottomNavigationBar(
              backgroundColor: bottomtabclr,
              selectedItemColor: btnttext,
              unselectedItemColor: btnttext,
              onTap: _selectPage,
              currentIndex: _selectedPageIndex,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0 ),
                    child: SvgPicture.asset(
                      "assets/svg/home.svg",
                      color: (_selectedPageIndex == 0) ? btnttext : null,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0 ),
                    child: SvgPicture.asset(
                      "assets/svg/members.svg",
                      color: (_selectedPageIndex == 1) ? btnttext : null,
                    ),
                  ),
                  label: 'Member ',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0 ),
                    child: SvgPicture.asset(
                      "assets/svg/report.svg",
                      color: (_selectedPageIndex == 2) ? btnttext : null,
                    ),
                  ),
                  label: 'Report',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0 ),
                    child: SvgPicture.asset(
                      "assets/svg/wallett.svg",
                      color: (_selectedPageIndex == 3) ? btnttext : null,
                    ),
                  ),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 0 ),
                    child: SvgPicture.asset(
                      "assets/svg/withdrawel.svg",
                      color: (_selectedPageIndex == 4) ? btnttext : null,
                    ),
                  ),
                  label: 'Capital',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}