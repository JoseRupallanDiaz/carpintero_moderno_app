
import 'package:flutter/material.dart';

class FullScreenDialog extends StatefulWidget {
  @override
  _FullScreenDialogState createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)),
      insetAnimationDuration: const Duration(seconds: 1),
      insetAnimationCurve: Curves.easeInOut,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              
            ),
            Center(
              child: Text(
                'Diálogo a pantalla completa',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        )
      ),
    );
  }
}