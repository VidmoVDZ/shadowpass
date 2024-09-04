import 'init.dart';
import 'code.dart';
import 'dart:async';
// String decode(String password, List pattern)
// {
// 	String decodedPassword = "";


// 	for (String item in password.split("")) 
// 	{
// 		if (pattern.indexOf(item) - jump() < 0)
// 		{
// 			print(pattern.indexOf(item) + jump().abs());
// 			decodedPassword += pattern[(pattern.indexOf(item) - jump()).abs()];
// 		}
// 		else
// 		{
// 			decodedPassword += pattern[pattern.indexOf(item) - jump()];
// 		}
// 	}


// 	return decodedPassword;
// }

Future<String> decode(String password, List pattern)
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
