import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                'لا توجد هناك بيانات الرجاء البحث عن منطقة او قم بتشغيل الانترنت ةوأبدا',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchpage();
                }));
              },
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(220, 235, 235, 235),
                      blurRadius: 10,
                      offset: Offset(5, 1))
                ]),
                child: Text(
                  'أبحث الان 🔍',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
