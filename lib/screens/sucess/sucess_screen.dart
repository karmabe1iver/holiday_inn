import 'package:flutter/material.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({Key? key}) : super(key: key);

  get _green => Color.fromRGBO(80, 158, 47, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, 'scan');
        },
        onLongPress: (){
          Navigator.pushNamed(context, 'scan');
        },
        onLongPressCancel: (){
    Navigator.pushNamed(context, 'scan');

        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(

            onTap: (){
      Navigator.pushNamed(context, 'scan');
      },
        onLongPress: (){
          Navigator.pushNamed(context, 'scan');
        },
        onLongPressCancel: (){
          Navigator.pushNamed(context, 'scan');

        },

              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Wrap(
                  children: [
                    Container(
                      width: // double.infinity,
                          MediaQuery.of(context).size.width,
                      height: //150, //
                          MediaQuery.of(context).size.height * .35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: _green),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          offset: Offset.zero)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('asset/image/holiday1.png'),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      direction: Axis.vertical,
                      children: [
                        Text(
                          'Thank you!',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                            fontFamily: 'Poppins',
                            color: _green,
                          ),
                        ),
                        Text('Your Entry Confirmed',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontFamily: 'Poppins',

                        ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
