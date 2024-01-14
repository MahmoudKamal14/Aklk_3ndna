import 'package:aklk_3ndna/core/utils/payment_styles.dart';
import 'package:flutter/widgets.dart';

class PCustomButton extends StatelessWidget {
  const PCustomButton({
    super.key,
    this.onTap,
    required this.text,
  });

  final void Function()? onTap;

  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFFD85E2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.style22,
          ),
        ),
      ),
    );
  }
}
