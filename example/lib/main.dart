import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_dx_risk/flutter_dx_risk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _token = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {


    if (!mounted) return;
    /// Android requestPermissions
    await FlutterDxRisk().requestPermissions();

    /// call  getToken
    String? token = await FlutterDxRisk().getToken(appID: '6b7caed35576a02ac6bf5cd7f8631a73');

    setState(() {
      _token = token ?? "Get Error";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DingXiang Risk Plugin Example'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 100,),
              const Text('DingXiang Risk Token:'),
              Padding(
                padding: EdgeInsets.all(50),
                child: TextField(
                  maxLines: 2,
                  controller: TextEditingController.fromValue(
                      TextEditingValue(
                          text: _token,
                          selection: TextSelection.fromPosition(TextPosition(
                              affinity: TextAffinity.downstream,
                              offset: _token.length)
                          )
                      )
                  ),
                ),
              ),

              const Padding(padding: EdgeInsets.only(left: 50, right: 50),
              child: Text('Support: https://www.dingxiang-inc.com/business/fingerprint'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
