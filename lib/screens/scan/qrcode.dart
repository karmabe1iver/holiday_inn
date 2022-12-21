import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:xml/xml.dart';

import '../../model/xml_model.dart';
import '../guest details/guest_details.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  Barcode? result;
  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  get _green => const Color.fromRGBO(80, 158, 47, 1);

  @override
  void reassemble() {
    super.reassemble();

    if (Platform.isAndroid) {
      //controller!.resumeCamera();
       controller?.pauseCamera();
    }

    // controller?.resumeCamera();
    controller!.pauseCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 9, child: _buildQrView(context)),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     width:double.infinity,
          //     color: _green,
          //     child: FittedBox(
          //       fit: BoxFit.contain,
          //
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: <Widget>[
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: <Widget>[
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: IconButton(
          //                     // icon: Icon(Icons.flash_on),
          //                     //style: ButtonStyle(
          //                     // backgroundColor:
          //                     // MaterialStatePropertyAll(Colors.black)),
          //                     onPressed: () async {
          //                       await controller?.toggleFlash();
          //                       setState(() {});
          //                     },
          //                     icon: FutureBuilder(
          //                       future: controller?.getFlashStatus(),
          //                       builder: (context, snapshot) {
          //                         return const Icon(Icons.flash_on_outlined);
          //
          //                         // ('Flash: ${snapshot.data}');
          //                       },
          //                     )),
          //               ),
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: IconButton(
          //                     // style: ButtonStyle(
          //                     // backgroundColor:
          //                     // MaterialStatePropertyAll(Colors.black)),
          //                     onPressed: () async {
          //                       await controller?.flipCamera();
          //                       setState(() {
          //                         // controller!.resumeCamera();
          //                         // reassemble();
          //                       });
          //                     },
          //                     icon: FutureBuilder(
          //                       future: controller?.getCameraInfo(),
          //                       builder: (context, snapshot) {
          //                         if (snapshot.data != controller?.resumeCamera()) {
          //                           return const Icon(Icons.camera_alt);
          //                           //SnackBar(content :Text(
          //                           //'Camera facing ${describeEnum(snapshot.data!)}'),
          //
          //                         } else {
          //                           return const SnackBar(
          //                               content: Text('loading'));
          //                         }
          //                       },
          //                     )),
          //               ),
          //               // ]
          //               //  Row(
          //               //    mainAxisAlignment: MainAxisAlignment.end,
          //               //  crossAxisAlignment: CrossAxisAlignment.center,
          //               //   children: <Widget>[
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: IconButton(
          //                   icon: const Icon(Icons.stop_rounded),
          //
          //                   //   style: ButtonStyle(
          //                   //backgroundColor:
          //                   // MaterialStatePropertyAll(Colors.black)),
          //                   onPressed: () async {
          //                     await controller?.pauseCamera();
          //                   },
          //                   //child: const Text('pause',
          //                   //   style: TextStyle(fontSize: 20)),
          //                 ),
          //               ),
          //               Container(
          //                 margin: const EdgeInsets.all(8),
          //                 child: IconButton(
          //                   icon: const Icon(Icons.play_arrow_outlined),
          //                   //style: ButtonStyle(
          //                   // backgroundColor:
          //                   //MaterialStatePropertyAll(Colors.black)),
          //                   onPressed: () async {
          //                     await controller?.resumeCamera();
          //                   },
          //                   //child: const Text('resume',
          //                   // style: TextStyle(fontSize: 20)),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: _green,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      controller.resumeCamera();
      this.controller = controller;

    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        //  result = scanData;
        var ro = {scanData.code}.first;
        var root2 = XmlDocument.parse(ro!).getElement('PrintLetterBarcodeData');
        var root1 =
            XmlDocument.parse(sample1).getElement('PrintLetterBarcodeData');
        if (root2?.firstElementChild == root1?.firstElementChild) {
          result = scanData;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GuestDetails(
                result: result,
              ),
            ),
          );

          print('${{scanData.code}.length}');
        } else {
          Navigator.pushNamed(context, '/');
          print('${{scanData.code}.length}');
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
