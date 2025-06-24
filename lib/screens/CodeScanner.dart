import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';



class CodeScanner extends StatelessWidget {


  const CodeScanner({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        iconTheme: const IconThemeData(color: Colors.white), //should change the color of the arrow
        title: 
        
          Text("QR CODE SCANNER",
          style: TextStyle(
            color: Color(0xFFF2AC02),
            fontFamily: 'Adumu', //adds the custom font
            fontSize: 20,
            /*foreground: Paint() -> this was supposed to add a black border to the letters
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,*/
          ),
            
            
         ),
        
          
      
        //adds the background image
        flexibleSpace: FlexibleSpaceBar(
          background: Image(
            image: AssetImage('lib/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),

        backgroundColor: Colors.transparent,

      ),

     
      body: Center(
        child: const QR(),
        )
      );
  }

  }


class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRState();
}

class _QRState extends State<QR> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: <Widget>[
    
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
            fit: BoxFit.contain,
            child: Container( //container added to set the background image
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFF2AC02),
                    width: 3.0,
                  ),
                  
                ),
                image: DecorationImage(
                  image: AssetImage('lib/images/background.png'),
                  fit: BoxFit.cover,
                ),
                
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (result != null)
                Text(
                  'Barcode Type: ${result!.format.name}   Data: ${result!.code}')
                else
                const Text('Scan a code', 
                  style: TextStyle(color: Colors.white,
                  fontFamily: 'Poppins')
                  ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      
                      builder: (context, snapshot) {
                       Icon flashIcon = snapshot.data == true
                       ? const Icon(Icons.flash_on, color: Color(0xFFF2AC02)) 
                       : const Icon(Icons.flash_off, color: Color(0xFFF2AC02));

                       return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: Colors.white,
                          //padding: 
                        ),


                          icon: flashIcon,
                          onPressed: () async {
                              await controller?.toggleFlash();
                                setState(() {});
                            
                          },
                          label: Text(

                              snapshot.data == true ? 'Flash On': 'Flash Off',
                              style: const TextStyle(color: Color(0xFFF2AC02)),

                          ),
                          
                          
                        );
                       },
                     )
                    ),
                  
                  Container(
                  margin: const EdgeInsets.all(8),
                  child:FutureBuilder(
                      future: controller?.getFlashStatus(),
                      
                      builder: (context, snapshot) {
                       Icon camara = snapshot.data == true
                       ? Icon(Icons.flip_camera_ios, color: Color(0xFFF2AC02)) 
                       : Icon(Icons.flip_camera_ios, color: Color(0xFFF2AC02));

                       return ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          backgroundColor: Colors.white,
                          //padding: 
                         ),
                          icon: camara,
                          onPressed: () async {
                              await controller?.flipCamera();
                                setState(() {});
                            
                          },
                          label: Text(

                              'Flip Camera',
                              style: const TextStyle(color: Color(0xFFF2AC02)),

                          ),
                          
                          
                        );
                       },
                     
                    ),
                  ),
                ],
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                    await controller?.pauseCamera();
                    },
                    child: const Text('Pause',
                      style: TextStyle(fontSize: 10)),
                  ),
                  ),
                  Container(
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                    await controller?.resumeCamera();
                    },
                    child: const Text('Resume',
                      style: TextStyle(fontSize: 10)),
                  ),
                  )
                ],
                ),
              ],
              ),
            ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color(0xFFF2AC02),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
  }
  }




