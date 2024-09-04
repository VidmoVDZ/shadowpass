import 'init.dart';
import 'dart:async';
Future<String> codePass(List pattern, String password) async
{
	int listLength = pattern.length;

	String passwordCodeed = "";

	for (String item in password.split(""))
	{
		// if index is out of range 
		// (just jump + indexLetter is higher than max index of pattern)
		if (pattern.indexOf(item) + jump() > pattern.length - 1) 
		{
			// just make this shit!
			passwordCodeed += pattern[(pattern.indexOf(item) + jump() - 1) - (pattern.length - 1)];
		}
		else
		{	// if not higher then just do this..
			passwordCodeed += pattern[pattern.indexOf(item) + jump()];
		}
	}

	return passwordCodeed;
}
