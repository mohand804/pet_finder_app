import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final bool isLoading;
  final WidgetStateProperty<Color?>? backgroundColor;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton({
    this.borderColor,
    super.key,
    required this.text,
    this.style,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
          color: (onPressed == null
              ? ColorsManager.primaryColor.withValues(alpha: 0.6)
              : ColorsManager.primaryColor),
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: borderRadius ?? BorderRadius.circular(50),
        ),
        child: Center(
          child: isLoading || onPressed == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          style?.color ?? Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Text(text, style: style),
        ),
      ),
    );
  }
}
