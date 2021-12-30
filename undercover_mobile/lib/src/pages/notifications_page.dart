import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import '../blocs/notifications/notifications_bloc.dart';
import '../utils/font.dart';
import '../widgets/section_header.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return getMyNotifications();
  }

  Widget getMyNotifications() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
            child: sectionHeader(S.of(context).myNotifications, seeAll: false),
          ),
          BlocBuilder<NotificationsBloc, NotificationsState>(
              builder: (context, status) {
            if (status is LoadingNotifications) {
              return const CircularProgressIndicator();
            } else if (status is NotificationsLoaded) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: status.notifications.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: const Icon(FontAwesomeIcons.envelope),
                      title: Text(
                        status.notifications[index].title,
                        style: titleStyle,
                      ),
                      subtitle: Text(
                        status.notifications[index].message,
                        style: subtitleStyle,
                      ),
                    );
                  });
            } else {
              return Container(
                height: 200,
                width: 200,
              );
            }
          }),
        ],
      ),
    );
  }
}
