import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/user/user_bloc.dart';

class UserErrorState extends StatelessWidget {
  final UserState state;
  final VoidCallback onRetry;

  const UserErrorState({super.key, required this.state, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded, size: 80.w, color: Colors.grey[400]),
          SizedBox(height: 24.h),
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            state.error ?? 'Please try again later',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          FilledButton.icon(
            icon: Icon(Icons.refresh, size: 20.w),
            label: Text('Retry', style: TextStyle(fontSize: 14.sp)),
            onPressed: onRetry,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}