import 'init.dart';
import 'dart:async';
Future<String> codePass(List pattern, String password) async
{
	int listLength = pattern.length;

	String passwordCodeed = "";

	for (String item in password.split(""))
	{
		if (pattern.indexOf(item) + jump() > pattern.length - 1)
		{
			passwordCodeed += pattern[(pattern.indexOf(item) + jump() - 1) - (pattern.length - 1)];
		}
		else
		{
			passwordCodeed += pattern[pattern.indexOf(item) + jump()];
		}
	}

	return passwordCodeed;
}