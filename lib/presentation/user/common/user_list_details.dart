import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_management/data/models/user/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class UserListDetails extends StatefulWidget {
  final UserModel user;

  const UserListDetails({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserListDetails> createState() => _UserListDetailsState();
}

class _UserListDetailsState extends State<UserListDetails> {
  @override
  Widget build(BuildContext context) {
    final Uri viber = Uri.parse('viber://add?number=${widget.user.viber}');
    final Uri whatsapp = Uri.parse('https://wa.me/${widget.user.whatsapp}');
    final Uri email = Uri(
      scheme: 'mailto',
      path: widget.user.email,
      query: 'subject=Hello&body=Hello%20World',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.user.picture),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      widget.user.position,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    launchUrl(viber);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.viber,
                    color: Color.fromARGB(255, 166, 140, 170),
                  )),
              IconButton(
                  onPressed: () {
                    launchUrl(whatsapp);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    launchUrl(email);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.envelope,
                    color: Color.fromARGB(255, 247, 76, 24),
                  )),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Applied Date: ${widget.user.appliedDate}'),
          ),
        ],
      ),
    );
  }
}
