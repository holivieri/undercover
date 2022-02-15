import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../blocs/gps/gps_bloc.dart';
import '../routes/routes.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnabled
                ? const _EnableGpsMessage()
                : const _AccessButton();
          },
        ),
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              S.of(context).gpsAccessTitle,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(height: 25),
          MaterialButton(
            color: Colors.green,
            shape: const StadiumBorder(),
            elevation: 10,
            splashColor: Colors.transparent,
            onPressed: () async {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              await gpsBloc.askGpsAccess();
            },
            child: Text(
              S.of(context).gpsAccessButtonText,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.black,
              shape: const StadiumBorder(),
              elevation: 10,
              splashColor: Colors.transparent,
              onPressed: () async {
                await Navigator.pushReplacementNamed(context, homeRoute);
              },
              child: Text(
                S.of(context).home,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).gpsMustBeEnabled,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
