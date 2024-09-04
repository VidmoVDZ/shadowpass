import 'init.dart';
import 'code.dart';
import 'dart:async';

Future<String> decode(String password, List pattern) async // just reversing coded password!
{
    String decodedPassword = "";

    for (String item in password.split("")) 
    {
        int index = pattern.indexOf(item);
        int newIndex = (index - jump()) % pattern.length;
        if (newIndex < 0) {
            newIndex += pattern.length;
        }
        decodedPassword += pattern[newIndex];
    }

    return decodedPassword;
}
