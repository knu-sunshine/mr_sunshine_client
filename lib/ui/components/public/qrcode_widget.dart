import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:mr_sunshine_client/constants/colors.dart';

class QRCodeWidget extends StatefulWidget {
  const QRCodeWidget({
    super.key,
  });

  @override
  State<QRCodeWidget> createState() => _QRCodeWidgetState();
}

class _QRCodeWidgetState extends State<QRCodeWidget> {
  final scannedCode = TextEditingController(text: 'QR Code');

  QRViewController? controller;

  final qrKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: _buildQrView(),
    );
  }

  _buildQrView() {
    var scanArea = MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400
        ? 150
        : 200;
    return QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: AppColor.primary,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea.toDouble()),
        onPermissionSet: (ctrl, p) => onPermissionSet(ctrl, p));
  }

  onPermissionSet(controller, bool p) {
    if (!p)
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No Permission')));
  }

  Future<void> onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // setState(() {
      //   scannedCode.text = scanData.code ?? '';
      // });
      controller.pauseCamera();
      Future.delayed(const Duration(seconds: 1));

      Get.arguments['setValue'](scanData.code);
      Get.back();
    }, onDone: () {
      debugPrint('Finished Scanning');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    scannedCode.dispose();
    super.dispose();
  }
}
