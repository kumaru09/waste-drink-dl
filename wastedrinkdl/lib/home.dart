import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wastedrinkdl/result.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future _pickImage({required source}) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final _pickedImage = await _picker.pickImage(source: source);

      if (_pickedImage == null) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResultPage(image: File(_pickedImage.path))));
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(
            content: Text("อัพโหลดรูปภาพไม่สำเร็จ กรุณาลองอีกครั้ง")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x40000000),
                    blurRadius: 8.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 5.0),
                  )
                ],
              ),
              child: const Center(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  width: 103,
                  height: 109,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(context).textTheme.headline6!.merge(
                          TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => _pickImage(source: ImageSource.camera),
                      child: Card(
                        elevation: 2,
                        color: const Color(0xFFFAEDCA),
                        child: ListTile(
                          leading: const Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFFF2C078),
                            size: 40,
                          ),
                          title: Text(
                            'Camera',
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () => _pickImage(source: ImageSource.gallery),
                      child: Card(
                        elevation: 2,
                        color: const Color(0xFFFAEDCA),
                        child: ListTile(
                          leading: const Icon(
                            Icons.photo_outlined,
                            color: Color(0xFFF2C078),
                            size: 40,
                          ),
                          title: Text(
                            'Galery',
                            style: Theme.of(context).textTheme.subtitle1!.merge(
                                TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ),
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
