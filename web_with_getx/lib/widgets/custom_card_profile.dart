import 'package:flutter/material.dart';

import '../constants.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return loaddata();
  }

  Widget creatspace() {
    return const SizedBox(
      height: 25,
    );
  }

  Widget creatrow(String component, String content, {int? size}) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Icon(
          Icons.check_circle,
          color: Colors.greenAccent.shade700,
        ),
        Text("$component : $content")
      ],
    );
  }

  Widget loaddata() {
    if (size.width < kMediumsize) {
      return Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 10,
              child: Container(
                width: 250,
                height: 480,
                color: Colors.grey[100],
                child: Column(
                  children: [
                    creatspace(),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('image/flower.jpg'),
                    ),
                    creatspace(),
                    const Text(
                      'S.M.A.KH',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    creatspace(),
                    creatrow('Education', 'Dr.Khalili'),
                    creatspace(),
                    creatrow('Job', 'Computer Engineer'),
                    creatspace(),
                    creatrow('Age', '20'),
                    creatspace(),
                    creatrow('University', 'Meybod University'),
                    creatspace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.telegram,
                            size: 30,
                          ),
                          color: Colors.blueAccent,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Text(
                "Dr.Khalili is an assistant professor at Computer Engineering Department,\nIran University of Science and Technology, Tehran, Iran.\nAt the same time,He is also Research Fellow at Department of Knowledge Engineering, Maastricht University, Maastricht, The Netherlands.",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      );
    } else if (size.width < kLargesize) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 10,
            child: Container(
              width: 250,
              color: Colors.grey[100],
              child: Column(
                children: [
                  creatspace(),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('image/flower.jpg'),
                  ),
                  creatspace(),
                  const Text(
                    'S.M.A.KH',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  creatspace(),
                  creatrow('Education', 'Dr.Khalili', size: 10),
                  creatspace(),
                  creatrow('Job', 'Computer Engineer', size: 10),
                  creatspace(),
                  creatrow('Age', '20', size: 10),
                  creatspace(),
                  creatrow('University', 'Meybod University', size: 10),
                  creatspace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.telegram,
                          size: 30,
                        ),
                        color: Colors.blueAccent,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Text(
                "Dr.Khalili is an assistant professor at Computer Engineering Department,\nIran University of Science and Technology, Tehran, Iran.\nAt the same time,He is also Research Fellow at Department of Knowledge Engineering,\nMaastricht University, Maastricht, The Netherlands."),
          )
        ],
      );
    } else {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10,
              child: Container(
                width: 250,
                height: 500,
                color: Colors.grey[100],
                child: Column(
                  children: [
                    creatspace(),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('image/flower.jpg'),
                    ),
                    creatspace(),
                    const Text(
                      'S.M.A.KH',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    creatspace(),
                    creatrow('Education', 'Dr.Khalili'),
                    creatspace(),
                    creatrow('Job', 'Computer Engineer'),
                    creatspace(),
                    creatrow('Age', '20'),
                    creatspace(),
                    creatrow('University', 'Meybod University'),
                    creatspace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.telegram,
                            size: 30,
                          ),
                          color: Colors.blueAccent,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
                "Dr.Khalili is an assistant professor at Computer Engineering Department,\nIran University of Science and Technology, Tehran, Iran.\nAt the same time,He is also Research Fellow at Department of Knowledge Engineering, Maastricht University, Maastricht, The Netherlands.",
                style: TextStyle(
                  fontSize: 15,
                )),
          ],
        ),
      );
    }
  }
}
