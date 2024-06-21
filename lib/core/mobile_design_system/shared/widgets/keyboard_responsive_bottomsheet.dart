import 'package:flutter/material.dart';

class KeyboardResponsiveBottomSheet extends StatefulWidget {
  final Widget child;
  final double initialChildSize;
  final double maxChildSize;
  final double minChildSize;

  const KeyboardResponsiveBottomSheet({
    super.key,
    required this.child,
    this.initialChildSize = 0.5,
    this.maxChildSize = 0.95,
    this.minChildSize = 0.25,
  });

  @override
  _KeyboardResponsiveBottomSheetState createState() =>
      _KeyboardResponsiveBottomSheetState();
}

class _KeyboardResponsiveBottomSheetState
    extends State<KeyboardResponsiveBottomSheet> with WidgetsBindingObserver {
  final DraggableScrollableController _scrollableController =
      DraggableScrollableController();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newIsKeyboardVisible = bottomInset > 0;
    if (newIsKeyboardVisible != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newIsKeyboardVisible;
        _scrollableController.animateTo(
          _isKeyboardVisible ? widget.maxChildSize : widget.initialChildSize,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DraggableScrollableSheet(
          controller: _scrollableController,
          initialChildSize: widget.initialChildSize,
          maxChildSize: widget.maxChildSize,
          minChildSize: widget.minChildSize,
          expand: false,
          builder: (context, scrollController) => SingleChildScrollView(
            controller: scrollController,
            child: widget.child,
          ),
        ),
        if (_isKeyboardVisible)
          Positioned.fill(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {},
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
      ],
    );
  }
}
