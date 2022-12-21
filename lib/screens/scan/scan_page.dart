
import 'package:flutter/material.dart';

import 'package:holidayinn/screens/scan/qrcode.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  get _green =>const Color.fromRGBO(80, 158, 47, 1);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        body: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                  borderRadius:const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: _green),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    bottom: 25,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.asset(
                          'asset/image/office.png',
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  Positioned(
                      left: 20,
                      bottom: 30,
                      child: Image.asset('asset/image/plant.png')),
                ],
              ),
            ),
            Column(
              children: [
               const Text(
                  "Welcome To",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Holiday Inn',
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: _green),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(_green),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QrCodeScanner()));


                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/image/iconidentificationbadge.png',
                        scale: 1,
                      ),
                     const Text(
                        ' Scan Your ID',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
           const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
