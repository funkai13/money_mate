import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraggableSheet extends ConsumerStatefulWidget {
  final Widget child;
  const DraggableSheet({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends ConsumerState<DraggableSheet> {
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(0.05);
  void anchor() => animateSheet(0.5);
  void expand() => animateSheet(0.95);
  void hide() => animateSheet(0.0);

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double minHeight = 0.05; // Define un tamaño mínimo fijo
      double maxHeight = 0.95; // Define un tamaño máximo fijo
      double initialSize = 0.5; // Define un tamaño inicial

      return DraggableScrollableSheet(
        controller: controller,
        initialChildSize: initialSize,
        minChildSize: minHeight,
        maxChildSize: maxHeight,
        expand: true,
        snap: true,
        snapSizes: [initialSize],
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22), topRight: Radius.circular(22)),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
