import 'package:cardsimtixon/Pages/allcards.dart';
import 'package:cardsimtixon/cantroller/cards_controller.dart';
import 'package:cardsimtixon/components/myTextcoponient.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

import 'addpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = false;
  @override
  void initState() {
    isloading = true;
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardsController>().getCategory();
    });
    isloading = false;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final event = context.read<CardsController>();
    final state = context.watch<CardsController>();
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  88.verticalSpaceFromWidth,
                  const Text(
                    'Checkout',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  8.verticalSpaceFromWidth,
                  const Text(
                    '300,00',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  35.verticalSpaceFromWidth,
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Saved Cards',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const AddPage();
                            },
                          ));
                        },
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.add,
                              color: Colors.orange,
                            ),
                            const Text(
                              'Add New',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  isloading
                      ? Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white, size: 35),
                        )
                      : Cardspage(),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
