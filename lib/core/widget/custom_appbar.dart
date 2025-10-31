import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final bool centerTitle;
  final bool usePrimaryColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
    this.showBackButton = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.centerTitle = false,
    this.usePrimaryColor = true, // Default to using primary color
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Smart color selection based on theme
    final defaultBackground = backgroundColor ??
        (usePrimaryColor ? theme.primaryColor : theme.appBarTheme.backgroundColor ?? theme.scaffoldBackgroundColor);

    final defaultForeground = foregroundColor ??
        (usePrimaryColor ? theme.colorScheme.onPrimary : theme.appBarTheme.foregroundColor ?? theme.colorScheme.onSurface);

    return AppBar(
      elevation: elevation,
      scrolledUnderElevation: 3.0,
      backgroundColor: defaultBackground,
      foregroundColor: defaultForeground,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: _getStatusBarBrightness(defaultBackground),
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: theme.scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
      title: Text(
        title,
        style: theme.textTheme.headlineMedium?.copyWith(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: defaultForeground,
        ) ?? TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: defaultForeground,
        ),
      ),
      centerTitle: centerTitle,
      leading: showBackButton ? _buildBackButton(context, defaultForeground, defaultBackground) : null,
      leadingWidth: 70.w,
      actions: actions != null
          ? [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Row(
            children: actions!,
          ),
        )
      ]
          : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context, Color color, Color backgroundColor) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          color: _getBackButtonColor(color, backgroundColor, isDark),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20.sp,
            color: color,
          ),
          splashRadius: 20.r,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: 40.w,
            minHeight: 40.h,
          ),
          onPressed: onBackPressed ?? () => context.pop(),
        ),
      ),
    );
  }

  // Helper method to determine status bar icon brightness based on background color
  Brightness _getStatusBarBrightness(Color backgroundColor) {
    final brightness = ThemeData.estimateBrightnessForColor(backgroundColor);
    return brightness == Brightness.dark ? Brightness.light : Brightness.dark;
  }

  // Helper method for back button background color
  Color _getBackButtonColor(Color foregroundColor, Color backgroundColor, bool isDark) {
    if (usePrimaryColor) {
      return foregroundColor.withValues(alpha: 0.1);
    }
    return isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1);
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}