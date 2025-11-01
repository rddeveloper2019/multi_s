import 'package:flutter/material.dart';

class SubcategoryProducts extends StatelessWidget {
  final String subCategoryName;
  final String mainCategoryName;
  const SubcategoryProducts({
    super.key,
    required this.mainCategoryName,
    required this.subCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subCategoryName)),
      body: Center(child: Text(mainCategoryName)),
    );
  }
}
