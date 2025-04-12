import 'package:api_integration/Routes/Routes.dart';
import 'package:api_integration/Routes/Routes_name.dart';
import 'package:api_integration/view-model/Api_Integ_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) =>ApiIntegViewmodel ())],

          child: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Api Integration',
                theme: ThemeData(
                  applyElevationOverlayColor: true,
                  brightness: Brightness.light,
                  appBarTheme: AppBarTheme(color: Colors.blue),
                  primarySwatch: Colors.blue,
                  textTheme: Typography.englishLike2018.apply(
                    fontSizeFactor: 1.sp,
                  ),
                ),
                initialRoute: RoutesName.home,
                onGenerateRoute: Routes.generate_Route,
              );
            },
          ),
        );
      },
    );
  }
}