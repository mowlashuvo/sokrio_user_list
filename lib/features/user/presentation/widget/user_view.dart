import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/user_entity.dart';

class UserTile extends StatelessWidget {
  final UserDataEntity user;
  final VoidCallback onTap;

  const UserTile({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Material(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        theme.colorScheme.primary.withOpacity(0.1),
                        theme.colorScheme.secondary.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: ClipOval(
                      child: _buildAvatar(),
                    ),
                  ),
                ),

                SizedBox(width: 16.w),

                // User information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        _getDisplayName(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black87,
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: 4.h),

                      // Email
                      if (user.email != null && user.email!.isNotEmpty)
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 14.w,
                              color: Colors.grey[500],
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                user.email!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                  height: 1.2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                      SizedBox(height: 8.h),

                      // User ID tag
                      if (user.id != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'ID: ${user.id}',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(width: 12.w),

                // Chevron icon
                Icon(
                  Icons.chevron_right_rounded,
                  size: 20.w,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    if (user.avatar == null || user.avatar!.isEmpty) {
      return Container(
        color: Colors.grey[300],
        child: Icon(
          Icons.person,
          size: 24.w,
          color: Colors.grey[600],
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: user.avatar!,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[300],
        child: Center(
          child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[300],
        child: Icon(
          Icons.person,
          size: 24.w,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  String _getDisplayName() {
    final firstName = user.firstName ?? '';
    final lastName = user.lastName ?? '';

    if (firstName.isEmpty && lastName.isEmpty) {
      return 'Unknown User';
    }

    return '$firstName $lastName'.trim();
  }
}

// Compact version for lists with high density
class UserTileCompact extends StatelessWidget {
  final UserDataEntity user;
  final VoidCallback onTap;

  const UserTileCompact({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.primary.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: _buildCompactAvatar(),
                ),
              ),

              SizedBox(width: 12.w),

              // User info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getDisplayName(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    if (user.email != null && user.email!.isNotEmpty)
                      Text(
                        user.email!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),

              // Chevron for compact version
              Icon(
                Icons.chevron_right_rounded,
                size: 18.w,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactAvatar() {
    if (user.avatar == null || user.avatar!.isEmpty) {
      return Container(
        color: Colors.grey[300],
        child: Icon(
          Icons.person,
          size: 20.w,
          color: Colors.grey[600],
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: user.avatar!,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[300],
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[300],
        child: Icon(
          Icons.person,
          size: 20.w,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  String _getDisplayName() {
    final firstName = user.firstName ?? '';
    final lastName = user.lastName ?? '';

    if (firstName.isEmpty && lastName.isEmpty) {
      return 'Unknown User';
    }

    return '$firstName $lastName'.trim();
  }
}