import 'package:dream_destiny/Startingpage.dart';

import 'package:dream_destiny/admin/addevent.dart';
import 'package:dream_destiny/admin/adlogin.dart';
import 'package:dream_destiny/admin/adminview.dart';
import 'package:dream_destiny/admin/grandevent.dart';
import 'package:dream_destiny/admin/rating.dart';
import 'package:dream_destiny/callvendor.dart';
import 'package:dream_destiny/categories.dart';
import 'package:dream_destiny/categories/allcategories.dart';
import 'package:dream_destiny/continuepage.dart';
import 'package:dream_destiny/dataupload_view/uploadweddingdata/uploaddata.dart';
import 'package:dream_destiny/district.dart';
import 'package:dream_destiny/eventmanagment.dart';
import 'package:dream_destiny/events/enquiry.dart';
import 'package:dream_destiny/events/eventrating.dart';
import 'package:dream_destiny/events/eventregister.dart';
import 'package:dream_destiny/events/eventscallvendor.dart';
import 'package:dream_destiny/events/eventsgrant.dart';

import 'package:dream_destiny/events/keralavenues.dart';
import 'package:dream_destiny/events/message.dart';
import 'package:dream_destiny/firebase_options.dart';
import 'package:dream_destiny/homepage.dart';

import 'package:dream_destiny/ideas.dart';

import 'package:dream_destiny/mybottomnavbar.dart';


import 'package:dream_destiny/packages.dart';
import 'package:dream_destiny/vendors.dart';
import 'package:dream_destiny/gopage.dart';
import 'package:dream_destiny/inbox.dart';
import 'package:dream_destiny/login.dart';
import 'package:dream_destiny/logo.dart';
import 'package:dream_destiny/people.dart';
import 'package:dream_destiny/profile.dart';
import 'package:dream_destiny/profileview.dart';
import 'package:dream_destiny/register.dart';
import 'package:dream_destiny/search.dart';
import 'package:dream_destiny/events/eventslogin.dart';
import 'package:dream_destiny/venues.dart';
import 'package:dream_destiny/weddingdate.dart';
import 'package:dream_destiny/categories/weddingvenues.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:Mybottomnavbar(),
      home:Login(),

    );
  }
}



 
     
         
 