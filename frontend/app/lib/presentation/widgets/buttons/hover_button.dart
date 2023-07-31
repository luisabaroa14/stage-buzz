import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String label;
  final Color borderColor;
  final Color hoverBorderColor;
  final VoidCallback onPressed;

  const HoverButton({
    super.key,
    required this.label,
    required this.borderColor,
    required this.hoverBorderColor,
    required this.onPressed,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _isHovered ? widget.hoverBorderColor : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: _isHovered ? widget.hoverBorderColor : widget.borderColor,
          ),
        ),
      ),
    );
  }
}
