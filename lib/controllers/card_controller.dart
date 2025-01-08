import 'package:flutter/material.dart';

class GlowCard extends StatefulWidget {
  final Widget child;
  final double borderRadius;

  const GlowCard({
    Key? key,
    required this.child,
    this.borderRadius = 16.0,
  }) : super(key: key);

  @override
  _GlowCardState createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _isHovering
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.6),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                  // BoxShadow(
                  //   color: Colors.blueAccent.withOpacity(0.3),
                  //   blurRadius: 30.0,
                  //   spreadRadius: 10.0,
                  // ),
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
        ),
        child: AnimatedScale(
          scale: _isHovering ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
