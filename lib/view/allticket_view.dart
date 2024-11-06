import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';

class AllticketView extends StatelessWidget {
  const AllticketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(
      builder: (context, authprovider, _) {
        return Scaffold(
          body: Center(
            child: StreamBuilder(
                stream: authprovider.getdata(),
                builder: (context, snapshot) {
                  var alldata = snapshot.data;
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: alldata.docs.length,
                        itemBuilder: (context, index) {
                          return Text("${snapshot.data!.docs[index].data()}");
                        });
                  }
                  return const Text("Till now no ticket purchased with us");
                }),
          ),
        );
      },
    );
  }
}
