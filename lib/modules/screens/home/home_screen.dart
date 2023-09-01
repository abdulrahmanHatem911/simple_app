import 'package:flutter/material.dart';
import 'package:simple_app/core/utils/app_size.dart';

import '../../../controller/network/local/hive_server.dart';
import '../../../controller/services/services_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Layout Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ServiceLocator.instance<HiveServer>().getAllUsers().then((value) {
                print(value);
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ServiceLocator.instance<HiveServer>().getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              separatorBuilder: (context, index) => AppSize.sv_10,
              itemBuilder: (context, index) {
                dynamic data = snapshot.data![index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 22,
                      child: Text(
                        data['count'].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(data['email']),
                    subtitle: Text(data['password']),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
