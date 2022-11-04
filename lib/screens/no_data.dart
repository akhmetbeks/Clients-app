import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/clients.dart';

class NoDataFound extends StatelessWidget {
  static const routeName = '/noDataFound';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: deviceSize.height -
            // appBar.preferredSize.height -
            mediaQuery.padding.top,
          width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset('assets/warning.svg'),
          const SizedBox(
            height: 37,
          ),
          const Text(
            'Не удалось загрузить информацию',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            width: 230,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: const Color(0xFF9B51E0).withOpacity(0.5),
              ),
              onPressed: () {
                Provider.of<Clients>(context, listen: false)
                    .getClients(context);
              },
              child: const Text(
                'Обновить',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
