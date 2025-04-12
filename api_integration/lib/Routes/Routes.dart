import 'package:api_integration/Routes/Routes_name.dart';
import 'package:api_integration/view-/home_view.dart';
import 'package:api_integration/view-/login_view.dart';
import 'package:api_integration/view-/signUp_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Routes {
  static Route<dynamic> generate_Route(RouteSettings set_Route)
  {
    switch(set_Route.name)
    {
      case RoutesName.home:
      {
        return MaterialPageRoute(builder: (BuildContext context)=>HomeView());
      }

      case RoutesName.login:
      {
        return MaterialPageRoute(builder: (BuildContext context)=>LoginView());
      }

      case RoutesName.signUp:
      {
        return MaterialPageRoute(builder: (BuildContext context)=>SignupView());
      }

      default:
      {
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Center(child: Text('NO Route Found it this name location'),),
        ));
      }
    }
  }
}