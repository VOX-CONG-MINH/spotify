import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../ui.dart';


@RoutePage()
class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BasePageState<MainScreenView, MainScreenBloc> {
  final List<Widget> _pages = [
    const HomePage(),
    const Placeholder(),
    const Placeholder(),
    const ProfilePages(),
  ];

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: (index) {
              bloc.add(ChangeTabEvent(index: index));
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(
                    Assets.icons.homeIcon.path, state.selectedIndex, 0),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                    Assets.icons.searchIcon.path, state.selectedIndex, 1),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                    Assets.icons.heartIcon.path, state.selectedIndex, 2),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                    Assets.icons.profileIcon.path, state.selectedIndex, 3),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIcon(String assetPath, int selectedIndex, int index) {
    return SvgPicture.asset(
      assetPath,
      colorFilter: ColorFilter.mode(
        selectedIndex == index ? Colors.green : Colors.grey,
        BlendMode.srcIn,
      ),
    );
  }
}
