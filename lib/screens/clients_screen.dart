import 'package:clients_scroll_app/providers/visibleText.dart';
import 'package:clients_scroll_app/widgets/clients.dart';
import 'package:clients_scroll_app/screens/no_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:visibility_detector/visibility_detector.dart';

import '../providers/clients.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({Key? key}) : super(key: key);
  static const routeName = '/clients';

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  var _isClientsTextVisible = true;

  @override
  Widget build(BuildContext context) {
    final textVisible = Provider.of<VisibleText>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;

    final appBar = AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Consumer<VisibleText>(
          builder: (ctx, value, _) {
            return value.isVisible == false
                ? Center(
                    child: const Text(
                      'Пользователи',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  )
                : const Text('');
          },
        ));

    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        appBar: appBar,
        body: Container(
          margin: EdgeInsets.only(top: 10),
          height: deviceSize.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top ,
          width: deviceSize.width,
          child: FutureBuilder(
            future: Provider.of<Clients>(context, listen: false)
                .getClients(context),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SvgPicture.asset('assets/loading.svg')]);
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Consumer<Clients>(
                  builder: (context, clientData, child) {
                    return SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            VisibilityDetector(
                                key: const Key('1'),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Пользователи',
                                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  textVisible.isVisibleText(info);
                                }),
                            const SizedBox(height: 24),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: clientData.items.length,
                              itemBuilder: (ctx, i) {
                                return ClientListTile(
                                  name: clientData.items[i]['name'],
                                  email: clientData.items[i]['email'],
                                  username: clientData.items[i]['username'],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}
