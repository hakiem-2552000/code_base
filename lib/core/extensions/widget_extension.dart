import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget size({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
        child: this,
      );

  // Padding
  Widget paddingOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Padding(
          padding: EdgeInsets.only(
              left: left, right: right, bottom: bottom, top: top),
          child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  // Margin
  Widget marginOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      Container(
          margin: EdgeInsets.only(
              left: left, right: right, bottom: bottom, top: top),
          child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
      Container(
          margin:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: this);

  Widget marginAll(double value) =>
      Container(margin: EdgeInsets.all(value), child: this);

  Widget setBackgroundImage(double imageHeight, String asset) =>
      Stack(children: [
        Container(
            height: imageHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(asset), fit: BoxFit.cover))),
        this
      ]);

  Widget loadMore(VoidCallback onLoadMore) =>
      NotificationListener<ScrollNotification>(
        child: this,
        onNotification: (ScrollNotification info) {
          if (info.metrics.pixels == info.metrics.maxScrollExtent) {
            onLoadMore();
          }
          return true;
        },
      );
}
