import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../cantroller/cards_controller.dart';
import '../components/myTextcoponient.dart';

class Cardspage extends StatefulWidget {
  const Cardspage({super.key});

  @override
  State<Cardspage> createState() => _CardspageState();
}

class _CardspageState extends State<Cardspage> {
  @override
  Widget build(BuildContext context) {
    final event = context.read<CardsController>();
    final state = context.watch<CardsController>();
    return Expanded(
      child: ListView.builder(
        itemCount: state.listofcards.length,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.all(16),
              width: 342,
              height: 190,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/cardback.png')),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: state.listofcards[index].Type == 'mastercard'
                          ? Image.asset('assets/images/mastercard.png')
                          : state.listofcards[index].Type == 'visa'
                              ? Image.asset('assets/images/visa.png')
                              : state.listofcards[index].Type == 'uzcard'
                                  ? Image.network(
                                      'https://logos-download.com/wp-content/uploads/2022/01/Uzcard_Logo-700x367.png')
                                  : state.listofcards[index].Type == 'humo'
                                      ? Image.network(
                                          'https://kapitalbank.uz/upload/iblock/8a6/system_humo_c.png',
                                        )
                                      : Text(''),
                    ),
                    20.verticalSpaceFromWidth,
                    Text(
                      '${state.listofcards[index].number}',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    11.verticalSpaceFromWidth,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name',
                                style: CostumTextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                )),
                            Text(
                              '${state.listofcards[index].name}',
                              style: CostumTextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'Valid Till',
                              style: CostumTextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${state.listofcards[index].data}',
                              style: CostumTextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
