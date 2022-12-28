import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unlearning_assignment/models/flutterdevs.dart';
import 'package:unlearning_assignment/services/exceptions.dart';
import 'package:unlearning_assignment/services/mockapi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    Future<List<FDevelopers>> getDevs() async {
    try {
      return await MockApi.getFDevs(error: false);
    } on MajorException {
      rethrow;
    } on MinorException {
      rethrow;
    } catch (err) {
      rethrow;
    } finally {
      print('Finished');
    }
  }
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getDevs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              if (snapshot.error is MajorException) {
                final MajorException majorException =
                    snapshot.error as MajorException;
                return Text('${majorException.message}\n'
                    'Error Code: ${majorException.errorCode}');
              } else if (snapshot.error is MinorException) {
                final MinorException minorException =
                    snapshot.error as MinorException;
                return Text('${minorException.message}\n'
                    'Error Code: ${minorException.errorCode}');
              } else {
                return const Text('Unknown Error occurred');
              }
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final FDevelopers fdev = snapshot.data![index];
                  final String name = fdev.name;
                  final String email = fdev.email;
                  final number = fdev.number;

                  return ListTile(
                    title: Text(name,style: TextStyle(fontSize: 20),),
                    subtitle: Text(
                      'email: $email and number: $number'
                    ),
                  );
                },
              );
            } else if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return const Offstage();
            }
          },
        ),
      ),
    );
    
      
    
  }
}