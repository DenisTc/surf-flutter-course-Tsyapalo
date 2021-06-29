import 'package:flutter/material.dart';
import 'package:places/ui/colors.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 360,
        padding: const EdgeInsets.only(left: 16, top: 36),
        color: Colors.brown,
        child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Icon(Icons.arrow_back_ios_new,size: 15,),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 32,
                height: 32)),
      ),
      Container(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 2),
            child: Column(
              children: [
                Row(children: [
                  Text('Пряности и радости',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: textColorPrimary))
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Row(children: [
                    Text('ресторан',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: textColorPrimary,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            fontSize: 14)),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text('закрыто до 09:00',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: textColorSecondary,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              fontSize: 14)),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: (Text(
                      'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: textColorPrimary,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          fontSize: 14))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                      height: 48,
                      width: 328,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: cardGreebBtnColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Icon(Icons.earbuds_rounded, color: Colors.white,)),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Построить маршрут'.toUpperCase(),
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                      height: 1, color: Color.fromRGBO(124, 126, 146, 0.56)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 17, top:11, right: 14, bottom: 11),
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Icon(Icons.calendar_today, color: Color.fromRGBO(59, 62, 91, 0.56))),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 9),                                          child: Text(
                                          'Запланировать',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  124, 126, 146, 0.56),
                                              fontSize: 14,
                                              height: 1.2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 17, top:11, right: 14, bottom: 11),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(Icons.favorite_border, color: textColorPrimary)),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 9),
                                            child: Text(
                                          'В избранное',
                                          style: TextStyle(
                                              color: textColorPrimary,
                                              fontSize: 14,
                                              height: 1.2),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ])
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}