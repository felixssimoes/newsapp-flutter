import 'package:flutter/material.dart';
import 'package:newsapp/core/presentation.dart';

class GenericTextButton extends StatelessWidget {
  const GenericTextButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                textAlign: TextAlign.center,
                style: TextStyles.poppinsRegular.copyWith(
                  color: AppColors.camo,
                  fontSize: 14,
                  height: 1.5,
                )),
            Space.xs,
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.camo,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
