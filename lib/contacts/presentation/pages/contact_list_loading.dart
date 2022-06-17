import 'package:flutter/material.dart';

import '../widgets/contact_widgets.dart';

class ContactListLoadingPage extends StatelessWidget {
  const ContactListLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const ContactBackgroundDecoration(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Text('minimal', style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center),
                    const SizedBox(height: 20.0),
                    Text('CLIENTS', style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 30.0),
                    const SearchWidget(),
                    const SizedBox(height: 200.0),
                    const CircularProgressIndicator(color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
