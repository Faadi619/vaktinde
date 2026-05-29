import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/colors.dart';
import '../core/constants/text_styles.dart';
import '../core/constants/themes.dart';
import '../core/constants/assets.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  // Order must match Figma: Ana Sayfa | Kıble | FAB | İstatistikler | Profil
  static final List<_NavItem> _items = [
    _NavItem(
      assetIcon: AppAssets.anaSafyaIcon,
      activeAssetIcon: AppAssets.anaSafyaIcon,
      label: 'Ana Sayfa',
      path: '/home',
    ),
    _NavItem(
      assetIcon: AppAssets.kible,
      activeAssetIcon: AppAssets.kible,
      label: 'Kıble',
      path: '/qibla',
    ),
    _NavItem(
      icon: Icons.add,
      activeIcon: Icons.add,
      label: 'Hızlı İşaretle',
      path: '/quick-mark',
      isFab: true,
    ),
    _NavItem(
      assetIcon: AppAssets.istatistikler,
      activeAssetIcon: AppAssets.istatistikler,
      label: 'İstatistikler',
      path: '/stats',
    ),
    _NavItem(
      assetIcon: AppAssets.profil,
      activeAssetIcon: AppAssets.profil,
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
      bottomNavigationBar: _BottomNav(
        currentIndex: currentIndex,
        items: _items,
        onTap: (index) => context.go(_items[index].path),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bottom navigation bar
// ─────────────────────────────────────────────────────────────────────────────
class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    // AppTheme.bottomNavHeight (83) is the total including safe area.
    final navHeight = AppTheme.bottomNavHeight;

    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: navHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Top border
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(height: 1, color: AppColors.divider),
                ),
                // Nav item row
                Row(
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final isActive = index == currentIndex;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => onTap(index),
                        behavior: HitTestBehavior.opaque,
                        child: item.isFab
                            ? _FabSlot(label: item.label)
                            : _RegularNavItem(item: item, isActive: isActive),
                      ),
                    );
                  }),
                ),
                // Center FAB — floats 8px above nav top edge
                Positioned(
                  top: -8,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () => onTap(2),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryGreen.withValues(
                                alpha: 0.4,
                              ),
                              blurRadius: 14,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Regular nav item (icon + label)
// ─────────────────────────────────────────────────────────────────────────────
class _RegularNavItem extends StatelessWidget {
  const _RegularNavItem({required this.item, required this.isActive});

  final _NavItem item;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primaryGreen : AppColors.inactiveNav;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (item.assetIcon != null)
          Image.asset(
            isActive
                ? (item.activeAssetIcon ?? item.assetIcon!)
                : item.assetIcon!,
            width: 26,
            height: 26,
            color: color,
          )
        else if (item.icon != null)
          Icon(isActive ? item.activeIcon : item.icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          item.label,
          style: AppTextStyles.overline.copyWith(color: color),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Center FAB slot — transparent placeholder in row; actual FAB is in Stack
// ─────────────────────────────────────────────────────────────────────────────
class _FabSlot extends StatelessWidget {
  const _FabSlot({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyles.overline.copyWith(color: AppColors.inactiveNav),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Nav item data model
// ─────────────────────────────────────────────────────────────────────────────
class _NavItem {
  _NavItem({
    this.icon,
    this.activeIcon,
    this.assetIcon,
    this.activeAssetIcon,
    required this.label,
    required this.path,
    this.isFab = false,
  });

  final IconData? icon;
  final IconData? activeIcon;
  final String? assetIcon;
  final String? activeAssetIcon;
  final String label;
  final String path;
  final bool isFab;
}
