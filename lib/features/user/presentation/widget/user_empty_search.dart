import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserEmptySearch extends StatelessWidget {
  const UserEmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Icon(Icons.search_off_rounded, size: 80.w, color: Colors.grey[400]),
          SizedBox(height: 16.h),
          Text(
            'No users found',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.grey[600]),
          ),
          SizedBox(height: 8.h),
          Text(
            'Try adjusting your search terms',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
