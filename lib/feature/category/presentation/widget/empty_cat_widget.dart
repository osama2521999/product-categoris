import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/extensions.dart';


class EmptyCatWidget extends StatelessWidget {
  const EmptyCatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ZoomIn(
      child: SizedBox(
        width: 1.0.width,
        height: 0.4.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/not_found_search_icn.png",
              height: 80,
            ),
            const SizedBox(height: 20),
            Text(
              "Sorry no Result",
              style: theme.textTheme.titleLarge,
            ),
            Text(
              "please try another key",
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: const Color(0xFF343344)),
            )
          ],
        ),
      ),
    );
  }
}
