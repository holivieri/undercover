import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../blocs/concerts/concerts_bloc.dart';
import '../models/concert_model.dart';
import '../repositories/concerts_repository.dart';
import '../services/concerts_service.dart';
import '../utils/app_colors.dart';
import '../utils/colors.dart';
import '../utils/font.dart';
import '../widgets/back_button.dart';

class ConcertDetailsPage extends StatefulWidget {
  const ConcertDetailsPage({
    required this.concertId,
    Key? key,
  }) : super(key: key);

  final String concertId;

  @override
  State<ConcertDetailsPage> createState() => _ConcertDetailsPageState();
}

class _ConcertDetailsPageState extends State<ConcertDetailsPage> {
  late final ConcertsBloc concertBloc;
  Color _buttonColor = themeDanger;
  bool _assistance = false;

  @override
  void initState() {
    super.initState();
    final ConcertsService service = ConcertsService();
    final ConcertsRepository repository = ConcertsRepository(service);

    concertBloc = ConcertsBloc(repository)
      ..add(
        LoadConcert(widget.concertId),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConcertsBloc, ConcertsState>(
      bloc: concertBloc,
      builder: (context, state) {
        if (state is ConcertLoaded) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackArrowButton(),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
                  const BoxDecoration(gradient: themeBackgroundGradient),
              child: mainBody(state.concert),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: const BackArrowButton(),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget mainBody(Concert concert) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getConcertCoverPicture(concert),
          const SizedBox(height: 20),
          getConcertDetails(concert),
        ],
      ),
    );
  }

  Widget getConcertCoverPicture(Concert concert) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Image.network(concert.artist!.pictureUrl!),
    );
  }

  Widget getConcertDetails(Concert concert) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightBlue[50]!.withOpacity(0.5),
      ),
      width: 250,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              concert.artist!.name,
              style: subtitleStyle,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.follow_the_signs),
                Text(
                    '${concert.date.day}/${concert.date.month}/${concert.date.year}'),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.houseUser),
                Text(concert.place.name),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.locationArrow),
                Text(concert.place.city),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                concertBloc.add(UpdateAssistance(
                  attendance: !_assistance,
                  concertId: widget.concertId,
                ));
                _assistance = !_assistance;
                if (_assistance) {
                  _buttonColor = greenButtonColor;
                } else {
                  _buttonColor = themeDanger;
                }
              },
              style: ElevatedButton.styleFrom(primary: _buttonColor),
              child: BlocBuilder<ConcertsBloc, ConcertsState>(
                  bloc: concertBloc,
                  builder: (context, state) {
                    if (state is ConcertLoaded) {
                      if (state.attendance) {
                        _assistance = true;
                        _buttonColor = greenButtonColor;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text('Asistire'),
                            Icon(Icons.thumb_up),
                          ],
                        );
                      } else {
                        _assistance = false;
                        _buttonColor = Colors.red;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text('NO Asistire'),
                            Icon(Icons.thumb_down),
                          ],
                        );
                      }
                    } else if (state is LoadingConcert) {
                      return const CircularProgressIndicator();
                    } else {
                      return const Text('¿Asistire?');
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
