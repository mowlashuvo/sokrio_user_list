import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../bloc/user/user_bloc.dart';
import '../widget/user_view.dart';
import '../widget/user_loading_shimmer.dart';
import '../widget/user_empty_state.dart';
import '../widget/user_empty_search.dart';
import '../widget/user_bottom_loader.dart';
import '../widget/user_error_state.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  static const String route = '/user';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _scrollDebounce;
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.load());

    _controller.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  void _onScroll() {
    final state = context.read<UserBloc>().state;

    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 300 &&
        state.status == UserStatus.success &&
        !state.hasReachedMax &&
        !state.isLoadingMore) {
      if (_scrollDebounce?.isActive ?? false) return;

      _scrollDebounce = Timer(const Duration(milliseconds: 400), () {
        context.read<UserBloc>().add(const UserEvent.load());
      });
    }
  }

  void _onSearchChanged() {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();

    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      context.read<UserBloc>().add(UserEvent.search(query: _searchController.text));
    });
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<UserBloc>().add(const UserEvent.search(query: ''));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: isDark ? Colors.grey[900] : Colors.grey[50],
        appBar: AppBar(
          title: Text(
            "Users",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh, color: theme.colorScheme.primary),
              onPressed: () {
                context.read<UserBloc>().add(const UserEvent.refresh());
              },
              tooltip: 'Refresh',
            ),
          ],
        ),
        body: BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) =>
          previous.error != current.error || previous.message != current.message,
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error!),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            } else if (state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              );
            }
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if ((state.status == UserStatus.initial || state.status == UserStatus.loading) &&
                  state.data.isEmpty) {
                return const UserLoadingShimmer();
              }
              if (state.status == UserStatus.success || state.data.isNotEmpty) {
                return _buildUserList(state);
              }
              if (state.status == UserStatus.error) {
                return UserErrorState(
                  state: state,
                  onRetry: () => context.read<UserBloc>().add(const UserEvent.load()),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUserList(UserState state) {
    final users = state.data;
    final isLoadingMore = state.isLoadingMore;
    final hasSearchQuery = _searchController.text.isNotEmpty;

    if (users.isEmpty) return const UserEmptyState();

    return Column(
      children: [
        // Search Bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2)),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[500]),
                  onPressed: _clearSearch,
                )
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              ),
            ),
          ),
        ),

        // Results Header
        if (hasSearchQuery)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              children: [
                Text(
                  'Search Results',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.grey[600]),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${users.length}',
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ),

        // User List
        Expanded(
          child: RefreshIndicator.adaptive(
            onRefresh: () async => context.read<UserBloc>().add(const UserEvent.refresh()),
            child: users.isEmpty && hasSearchQuery
                ? const UserEmptySearch()
                : ListView.builder(
              controller: _controller,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: users.length + (isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == users.length) return const UserBottomLoader();

                final user = users[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 8.h),
                  child: UserTile(
                    user: user,
                    onTap: () {

                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    _scrollDebounce?.cancel();
    _searchDebounce?.cancel();
    super.dispose();
  }
}
