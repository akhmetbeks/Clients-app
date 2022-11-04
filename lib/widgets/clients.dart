import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientListTile extends StatelessWidget {
  final String name;
  final String email;
  final String username;

  ClientListTile({
    required this.name,
    required this.email,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          maxRadius: 30,
          minRadius: 30,
          backgroundImage: AssetImage('assets/usr_crcl.jpg'),
          backgroundColor: Colors.white,
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email,
              style: const TextStyle(fontSize: 13, color: Color(0xFF8A8A8F)),
            ),
            Text(
              username,
              style: const TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
