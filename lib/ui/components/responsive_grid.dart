import 'package:flutter/material.dart';
import '../theme/app_ui_constants.dart';

/// Helper widget that creates a responsive grid layout
/// that automatically adjusts the number of columns based on available width
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final double? childAspectRatio;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.padding,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final columns = AppUiConstants.calculateGridColumns(availableWidth);
        
        return GridView.builder(
          padding: padding ?? 
              const EdgeInsets.symmetric(
                horizontal: AppUiConstants.screenPadding,
                vertical: AppUiConstants.smallSpacing,
              ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: crossAxisSpacing ?? AppUiConstants.gridCrossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing ?? AppUiConstants.gridMainAxisSpacing,
            childAspectRatio: childAspectRatio ?? AppUiConstants.gridCardAspectRatio,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}

/// Extension to easily create responsive grid from any list of widgets
extension ResponsiveGridExtension on List<Widget> {
  Widget toResponsiveGrid({
    Key? key,
    EdgeInsetsGeometry? padding,
    double? crossAxisSpacing,
    double? mainAxisSpacing,
    double? childAspectRatio,
  }) {
    return ResponsiveGrid(
      key: key,
      padding: padding,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      childAspectRatio: childAspectRatio,
      children: this,
    );
  }
}
