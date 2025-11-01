import 'package:flutter/material.dart';
import 'package:multi_s/minor_screens/subcategory_products.dart';
import 'package:multi_s/utilities/categ_list.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Men Category',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.7,
                children: List.generate(men.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return SubcategoryProducts(
                              mainCategoryName: 'men',
                              subCategoryName: men[index],
                            );
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          child: Image.asset("assets/images/men/men$index.jpg"),
                        ),
                        Text(men[index]),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
