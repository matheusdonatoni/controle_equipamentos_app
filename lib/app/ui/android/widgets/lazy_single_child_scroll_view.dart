import 'package:controle_equipamentos/app/ui/android/widgets/loading.dart';
import 'package:flutter/material.dart';

class LazySingleChildScrollView extends StatefulWidget {
  final int itemCount;
  final Widget child;
  final Future<void> Function() onLoadingPortionReached;
  final double loadingTriggerOffset;
  final bool isLoadingMore;
  LazySingleChildScrollView({
    Key key,
    this.onLoadingPortionReached,
    this.loadingTriggerOffset = 0.0,
    this.itemCount,
    this.isLoadingMore = false,
    this.child = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  _LazySingleChildScrollViewState createState() =>
      _LazySingleChildScrollViewState();
}

class _LazySingleChildScrollViewState extends State<LazySingleChildScrollView> {
  /// Controller to listen to scroll position.
  final controller = ScrollController();

  /// Starts the widget being able to callback.
  bool _isCallbackEnabled = true;

  double get triggerLoadingOffset => widget.loadingTriggerOffset;

  Future<void> Function() get onLoadingPortionReached =>
      widget.onLoadingPortionReached;

  ScrollPosition get position => controller.position;

  double get pixels => position.pixels;
  double get maxScrollExtent => position.maxScrollExtent;

  bool get atLoadingPortion => pixels >= maxScrollExtent - triggerLoadingOffset;
  bool get notAtLoadingArea => !atLoadingPortion;

  Future<void> listner() async {
    if (notAtLoadingArea) _isCallbackEnabled = true;

    if (atLoadingPortion && _isCallbackEnabled) {
      _isCallbackEnabled = false;

      if (onLoadingPortionReached != null) await onLoadingPortionReached();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() async => await listner());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          widget.child,
          AnimatedSwitcher(
            duration: Duration(
              milliseconds: 300,
            ),
            child: _anchorBuilder,
          )
        ],
      ),
    );
  }

  Widget get _anchorBuilder {
    if (widget.isLoadingMore) {
      return const Padding(
        padding: const EdgeInsets.all(24),
        child: const Loading(),
      );
    } else {
      return SizedBox(
        height: 76,
      );
    }
  }
}
