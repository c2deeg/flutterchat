import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveRefreshIndicator extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const AdaptiveRefreshIndicator({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  State<AdaptiveRefreshIndicator> createState() =>
      _AdaptiveRefreshIndicatorState();
}

class _AdaptiveRefreshIndicatorState extends State<AdaptiveRefreshIndicator> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? buildWebParent()
        : (Platform.isAndroid ? buildAndroidParent() : buildIOSParent());
  }

  Widget buildWebParent() => RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: widget.child,
      onRefresh: widget.onRefresh);

  Widget buildAndroidParent() => RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: widget.child,
      onRefresh: widget.onRefresh);

  Widget buildIOSParent() =>
      CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: widget.onRefresh,
        ),
        SliverToBoxAdapter(
          child: widget.child,
        )
      ]);
}
