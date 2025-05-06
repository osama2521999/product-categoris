import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  BaseAppBar(
      {super.key,
      required BuildContext context,
      required String title,
      bool leading = false,
      required void Function() onPressed,
      super.actions})
      : super(
          elevation: 0,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          leading: leading
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: onPressed,
                )
              : const SizedBox(),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true,
          scrolledUnderElevation: 0.0,
        );
}
