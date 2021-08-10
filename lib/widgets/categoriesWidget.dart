import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/view/categoriesPage.dart';

class CategorieWidget extends StatelessWidget {
  const CategorieWidget({Key? key, required this.categorie}) : super(key: key);
  final String categorie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionChip(
          label: Text(categorie),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriePage(
                  categorie: categorie,
                ),
              ),
            );
          },
          backgroundColor: Colors.blueGrey[50],
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
