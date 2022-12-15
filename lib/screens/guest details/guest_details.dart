import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:xml/xml.dart';


import '../../model/xml_model.dart';
import '../denied/denied.dart';
import '../sucess/sucess_screen.dart';
import 'guest_form.dart';

class GuestDetails extends StatelessWidget {
  GuestDetails({Key? key, this.result}) : super(key: key);
  var result;
  get _green => Color.fromRGBO(80, 158, 47, 1);

  get _styleT => const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17,
      fontFamily: 'Poppins',
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    var sample = {result.code}.first;
    var root = XmlDocument.parse(sample).getElement('PrintLetterBarcodeData');
    return




 WillPopScope(
   onWillPop: () async{
     Navigator.pushReplacementNamed(context, "scan");

     return false;
   },
   child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
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
                  //Expanded( flex: 4,child: SizedBox(),)
                ],
              ),
            ),
            Positioned(top: 50, child: Container(
              height: MediaQuery.of(context).size.height * .8,
              width: MediaQuery.of(context).size.width * .85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    const BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 1), offset: Offset.zero)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          'Guest Details',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                          //foregroundImage: AssetImage('asset/image/iconuser.png',),
                          child: Image.asset(
                            'asset/image/iconuser.png',
                            scale: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //'Name',
                              PrintLetterBarcodeData.fromElement(root!).name.toString(),
                              style: _styleT,
                            ),
                            Divider(),
                            Text(
                              //'Year of Birth',
                              PrintLetterBarcodeData.fromElement(root!).yob.toString(),
                              style: _styleT,
                            ),
                            Divider(),
                            Text(
                              //'Gender',
                              PrintLetterBarcodeData.fromElement(root!)
                                  .gender
                                  .toString(),
                              style: _styleT,
                            ),
                            Divider(),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Phone number',
                                  hintStyle: _styleT),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print(describeEnum(result!.format));
                        DateTime dateTimeCreatedAt = DateTime.parse(
                            '${PrintLetterBarcodeData.fromElement(root!).yob.toString()}-01-01');
                        DateTime dateTimeNow = DateTime.now();
                        final differenceInDays =
                            dateTimeNow.difference(dateTimeCreatedAt).inDays;
                        if (differenceInDays > 9125) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SucessScreen(),
                          ));
                          print(differenceInDays);
                          print(BarcodeFormat.qrcode);
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Denied(
                              result= result,
                            ),
                          ));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.height * .23,
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(80, 158, 47, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
