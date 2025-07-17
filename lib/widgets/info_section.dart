import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final String value;
  final Widget? leading;
  final VoidCallback? onEdit;
  final  Color titleColor ;

  const InfoSection({
    super.key,
    required this.title,
    required this.value,
    this.leading,
    this.onEdit, 
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style:  TextStyle(
                      fontSize: 12, color:titleColor )),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (onEdit != null)
                    GestureDetector(
                      onTap: onEdit,
                      child: const Icon(Icons.edit,
                          size: 18, color: Colors.grey),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}