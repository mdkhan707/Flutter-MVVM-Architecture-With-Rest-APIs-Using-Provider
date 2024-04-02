import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttoncolor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 200,
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Center(
                child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              )),
      ),
    );
  }
}
