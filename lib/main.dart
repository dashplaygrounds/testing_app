import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Synpulse Diamond'),
          backgroundColor: Colors.blueGrey[900],
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          //   image: NetworkImage(
          //       'http://minio2023.dashmark.me:9998/bucket1/photo-1483347756197-71ef80e95f73.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=myMinioAdmin%2F20231005%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231005T071013Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d2be43c6c91baf637e974968c71ea4e7880a0eab71414eb7bb9338365547a589'),
          ),
        ),
      ),
    ),
  );
}
