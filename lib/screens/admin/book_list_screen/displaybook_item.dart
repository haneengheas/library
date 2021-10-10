import 'package:flutter/material.dart';
import 'package:library_guide/constant/styles.dart';
import 'package:library_guide/screens/admin/book_details/view.dart';
import 'package:library_guide/screens/admin/book_list_screen/eidt_button.dart';

class DisplaybookItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [BoxShadow(color: white, blurRadius: 6)],
          border: Border.all(color: purple, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'اسم الكتاب',
              style: appbarStyle,
            ),
            SizedBox(
              width: sizeFromWidth(context, 3.2),
            ),
            EditButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookDetails()));
                },
                image: 'edit'),
            EditButton(
                onTap: () {
                  print('hhhh');
                },
                image: 'delete'),
          ],
        ),
      ),
    );
  }
}
