import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/colors.dart';
import '../core/constants/themes.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  static const List<NavItem> _items = [
    NavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Ana Sayfa',
      path: '/home',
    ),
    NavItem(
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart,
      label: 'İstatistikler',
      path: '/stats',
    ),
    NavItem(
      icon: Icons.add_circle_outline,
      activeIcon: Icons.add_circle,
      label: 'İşaretle',
      path: '/quick-mark',
    ),
    NavItem(
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore,
      label: 'Kıble',
      path: '/qibla',
    ),
    NavItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profil',
      path: '/profile',
    ),
  ];

  int _currentIndex(String location) {
    for (int i = 0; i < _items.length; i++) {
      if (location.startsWith(_items[i].path)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = _currentIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => context.go(_items[index].path),
        items: _items,
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height:
              AppTheme.bottomNavHeight - MediaQuery.of(context).padding.bottom,
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isActive = index == currentIndex;
              final isFab = index == 2;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  behavior: HitTestBehavior.opaque,
                  child: isFab
                      ? FabNavItem(isActive: isActive, item: item)
                      : RegularNavItem(isActive: isActive, item: item),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class FabNavItem extends StatelessWidget {
  const FabNavItem({super.key, required this.isActive, required this.item});

  final bool isActive;
  final NavItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryGreen.withAlpha(77),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            isActive ? item.activeIcon : item.icon,
            color: AppColors.white,
            size: 26,
          ),
        ),
      ],
    );
  }
}

class RegularNavItem extends StatelessWidget {
  const RegularNavItem({super.key, required this.isActive, required this.item});

  final bool isActive;
  final NavItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isActive ? item.activeIcon : item.icon,
          color: isActive ? AppColors.primaryGreen : AppColors.mutedText,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          item.label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive ? AppColors.primaryGreen : AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}

class NavItem {
  const NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.path,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String path;
}
