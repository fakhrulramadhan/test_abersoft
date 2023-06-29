import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_product_controller.dart';

class DashboardProductView extends GetView<DashboardProductController> {
  const DashboardProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Product'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: 3,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const NetworkImage(
                            "https://i.ibb.co/QrTHd59/woman.jpg",
                          ),
                        ),
                        title: const Text("Jessica Doe"),
                        subtitle: const Text("Programmer"),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 3,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const NetworkImage(
                            "https://i.ibb.co/QrTHd59/woman.jpg",
                          ),
                        ),
                        title: const Text("Jessica Doe"),
                        subtitle: const Text("Programmer"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )

        // FutureBuilder(
        //   //future: Future,
        //   //initialData: InitialData,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     //jika tidak punya data
        //     if (!snapshot.hasData) {
        //       return const Center(
        //         child: Text("Tidak ada data"),
        //       );
        //     }

        //     return ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: 3,
        //       physics: const ScrollPhysics(),
        //       itemBuilder: (BuildContext context, int index) {
        //         return Card(
        //           child: ListTile(
        //             leading: CircleAvatar(
        //               backgroundColor: Colors.grey[200],
        //               backgroundImage: const NetworkImage(
        //                 "https://i.ibb.co/QrTHd59/woman.jpg",
        //               ),
        //             ),
        //             title: const Text("Jessica Doe"),
        //             subtitle: const Text("Programmer"),
        //           ),
        //         );
        //       },
        //     );
        //   },
        // ),
        );
  }
}
