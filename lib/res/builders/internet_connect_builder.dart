import 'package:flutter/material.dart';

// class InternetConnectBuilder extends StatelessWidget {
//   Widget child;
//
//   InternetConnectBuilder({super.key, required this.child});
//
//   var controller = StreamController<int>();
//
//   @override
//   Widget build(BuildContext context) {
//     _checkContinue();
//     return StreamBuilder(
//         initialData: 0,
//         stream: controller.stream,
//         builder: (c, snap) {
//           return _connectionBuilder();
//         });
//   }
//
//   _connectionBuilder() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi) {
//       return child;
//     } else {
//       return Scaffold(
//           body: Column(
//         children: [
//           const Text("data"),
//           ElevatedButton(
//               onPressed: () {
//                 _connectionBuilder();
//               },
//               child: const Text("Connect Again"))
//         ],
//       ));
//     }
//   }
//
//   _checkContinue() {
//     var count = 0;
//     Timer.periodic(const Duration(seconds: 5), (timer) {
//       count = count + 1;
//       controller.sink.add(count);
//     });
//   }
// }


class InterNetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InterNetExceptionWidget({super.key, required this.onPress});

  @override
  State<InterNetExceptionWidget> createState() =>
      _InterNetExceptionWidgetState();
}

class _InterNetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .15),
          const Icon(
            Icons.cloud_off,
            color: Colors.red,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                  'We’re unable to show results.\nPlease check your internet\nconnection.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 20)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .15),
          ElevatedButton(
            onPressed: widget.onPress,
            child: Center(
              child: Text(
                'RETRY',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
