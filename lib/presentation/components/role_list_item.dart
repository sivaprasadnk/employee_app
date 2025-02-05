import 'package:flutter/material.dart';

class RoleListItem extends StatelessWidget {
  const RoleListItem({
    super.key,
    required this.title,
    required this.callback,
    this.showDivider = true,
  });
  final String title;
  final VoidCallback callback;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback.call();
      },
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          if (showDivider) Divider(),
        ],
      ),
    );
  }
}
