import 'package:flutter/foundation.dart';

void safePrint(Object? message){
  if (kDebugMode) {
    print('=> - - - - - - - - - - - - - - - - <=');
    print(message);
    print('=> - - - - - - - - - - - - - - - - <=');
  }


}