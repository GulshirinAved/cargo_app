import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/src/core/send_token.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // try {
  // if (message.notification != null) {
  //   if (Platform.isAndroid) {
  //     SharedPreferencesAndroid.registerWith();
  //   }
  //   if (Platform.isIOS) {
  //     SharedPreferencesIOS.registerWith();
  //   }
  //   ConfigPreference(await SharedPreferences.getInstance());
  //   ConfigPreference.insertNotif(message);
  // }
  // } catch (e) {
  // print(e);
  // print('MerdanDev ${StackTrace.current}');
  // print(trace);
  // }
}

class FirebaseSetup {
  static void init(BuildContext context) async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    var set = await firebaseMessaging.requestPermission(
      alert: true,
      sound: true,
      badge: true,
      provisional: true,
    );
    if (set.authorizationStatus == AuthorizationStatus.authorized ||
        set.authorizationStatus == AuthorizationStatus.provisional) {
      if (context.mounted) {
        setupInteractedMessage(context);
      }
    }
    String? token = await firebaseMessaging.getToken();

    SendFcmTokenRepository().sendToken(token!);

    // var state = a.AuthBloc.instance.state;
    // bool date = SingletonSharedPreference.checkTokenTime();
    // if (state is a.VerifiedState && token != null && date) {
    //   String deviceName;
    //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //   if (Platform.isAndroid) {
    //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //     deviceName = '${androidInfo.brand}, ${androidInfo.model}';
    //   } else if (Platform.isIOS) {
    //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    //     deviceName = '${iosInfo.utsname.machine}, ${iosInfo.utsname.sysname}';
    //   } else {
    //     deviceName = 'UNKNOWN';
    //   }
    //   SettingsRepository.sendToken(deviceName: deviceName, fireToken: token);
    //   SingletonSharedPreference.setTokenTime();
    // }
  }

  static Future<void> setupInteractedMessage(BuildContext context) async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null && context.mounted) {
      _handleMessage(initialMessage, context);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleMessage(message, context);
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? apple = message.notification?.apple;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && (android != null || apple != null)) {
        // if (await Vibrate.canVibrate) {
        //   var type = FeedbackType.warning;
        //   Vibrate.feedback(type);
        // }
        // Soundpool pool =
        //     Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

        // int soundId = await rootBundle
        //     .load('assets/sounds/notification.mp3')
        //     .then((ByteData soundData) {
        //   return pool.load(soundData);
        // });
        // await pool.play(soundId);
        // NotificationProvider().add(AddMessage(
        //   message: NotificationModel.fromMap(message.toCustomMap()),
        // ));
        // n.NotificationBloc.instance.add(n.InitEvent());
        // if (message.data['order_id'] != null) {
        //   OrderBloc.instance.add(
        //     OpenOrderByIdEvent(
        //       id: intParser(message.data['order_id'])!,
        //     ),
        //   );
        // } else {
        //   OrderBloc.instance.add(
        //     InitEvent(),
        //   );
        // }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 5),
            content: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   FirebaseScreen.routeName,
                //   arguments: NotificationModel.fromMap(message.toCustomMap()),
                // );
                // Navigator.of(context).pushNamed(NotificationScreen.routeName);
              },
              child: Card(
                color: Colors.grey.shade500,
                child: ListTile(
                  title: Text(message.notification?.title ?? ''),
                  subtitle: Text(message.notification?.body ?? ''),
                ),
              ),
            ),
          )

              // duration: const Duration(seconds: 5),
              );
        }
      }
    }).onError((e) {
      // print('MerdanDev error was catched $e');
    });
  }

  static void _handleMessage(RemoteMessage message, BuildContext context) {
    // NotificationProvider().add(ReadEvent(id: message.messageId ?? 'null'));
    // if (message.data['order_id'] != null) {
    //   OrderBloc.instance.add(
    //     OpenOrderByIdEvent(
    //       id: intParser(message.data['order_id'])!,
    //     ),
    //   );
    // } else {
    //   OrderBloc.instance.add(
    //     InitEvent(),
    //   );
    //   Navigator.of(context).pushNamed(NotificationScreen.routeName);
    // }
  }
}
