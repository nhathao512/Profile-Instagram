import 'package:flutter/material.dart';

class StoryHighlight extends StatelessWidget {
  final IconData? icon;
  final String label;
  final int? imageIndex;

  const StoryHighlight({
    super.key,
    this.icon,
    required this.label,
    this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[800]!, width: 4),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child:
                  icon != null
                      ? Icon(icon, size: 30, color: Colors.white)
                      : Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/100?image=${imageIndex ?? 1}',
                            ),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                      ),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
