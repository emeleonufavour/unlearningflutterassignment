import 'package:unlearning_assignment/models/flutterdevs.dart';

import 'exceptions.dart';

class MockApi{
  static final List<FDevelopers> FlutterDevs = [
    FDevelopers(name: 'Favour', email: 'favour@gmail.com', number: 08028954567),
    FDevelopers(name: 'Eniola', email: 'enny@gmail.com', number: 09125436754),
    FDevelopers(name: 'Olumide', email: 'olumide@gmailcom', number: 07003457654),
    FDevelopers(name: 'Czar', email: 'czar@gmail.com', number: 08045682238)
  ];

  static Future<List<FDevelopers>> getFDevs(
      {bool? error = false}) async {
    await Future.delayed(const Duration(seconds: 5));
    if (error == true) {
      throw MajorException(
        message: 'Oops. There was an error encountered while trying to fetch data',
        errorCode: '404',
      );
    } else if (error == null) {
      throw MinorException(
        message: 'Server is down at the moment. Try again later',
        errorCode: '503',
      );
    }
    return FlutterDevs;
  }
}
