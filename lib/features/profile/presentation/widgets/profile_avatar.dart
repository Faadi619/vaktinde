import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets.dart';

/// 72×72 illustrated profile avatar (mosque illustration). Wraps the
/// downloaded Figma SVG.
class ProfileAvatar extends StatelessWidget {
  final double size;

  const ProfileAvatar({super.key, this.size = 72});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(AppAssets.profileAvatar, fit: BoxFit.contain),
    );
  }
}
