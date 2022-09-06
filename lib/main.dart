import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/providers/products_provider.dart';
import 'view/app_data/app_strings.dart';
import 'view/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ProductsProvider>(create: (_) => ProductsProvider()),
        // ChangeNotifierProvider<GenerateOtpForLoginProvider>(
        //     create: (_) => GenerateOtpForLoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppStrings.routeToSplash,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
