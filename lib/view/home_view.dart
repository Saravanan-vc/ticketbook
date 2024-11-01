import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketbook/model_view/login_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  @override
  void initState() {
     name = Provider.of<AuthenProvider>(context, listen: false).userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: Consumer<AuthenProvider>(
        builder: (context, authenpriver, _) => Text("${name ?? box.get(01)}"),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("${box.get(01)}");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
