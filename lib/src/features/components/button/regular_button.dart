import 'package:find_sport_task/src/common/values/colors.dart';
import 'package:flutter/material.dart';

class RegularButton extends StatelessWidget {
  final double height;
  final bool isLoading;
  final String title;
  final VoidCallback onTap;

  const RegularButton({
    Key? key,
    this.height = 37,
    this.isLoading = false,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.transparent,
        minimumSize: Size(double.infinity, height),
        maximumSize: Size(double.infinity, height),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Ink(
        height: height,
        width: double.infinity,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.00, -1.00),
            end: const Alignment(0, 1),
            colors: [AppColors.n01001F.withOpacity(0.68), AppColors.n01001F],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: height / 2,
                  width: height / 2,
                  child: const CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 3,
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
