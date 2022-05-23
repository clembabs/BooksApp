import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget child;

  const ActionButton({
    Key? key,
    this.onPressed,
    this.isLoading = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: MaterialButton(
        onPressed: isLoading ? null : onPressed,
        textColor: Colors.blue.shade700,
        textTheme: ButtonTextTheme.primary,
        minWidth: 100,
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.blue.shade700),
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : child,
      ),
    );
  }
}
