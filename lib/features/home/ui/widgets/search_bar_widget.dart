import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_cubit.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearch;
  const SearchBarWidget({super.key, required this.onSearch});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  Timer? _debounce;
  bool _hasText = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = context.read<CatBreedCubit>().searchController;
    _controller.addListener(_updateClearButtonVisibility);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.removeListener(_updateClearButtonVisibility);
    super.dispose();
  }

  void _updateClearButtonVisibility() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(query);
    });
  }

  void _clearSearch() {
    _controller.clear();
    context.read<CatBreedCubit>().getBreeds(10, 1);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600], size: 18.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                isDense: true,
                suffixIcon: _hasText
                    ? GestureDetector(
                        onTap: _clearSearch,
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey[600],
                          size: 18.sp,
                        ),
                      )
                    : Icon(Icons.tune, color: Colors.grey[600], size: 18.sp),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
