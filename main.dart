import 'dart:async';
import 'package:ansi/ansi.dart';
// import 'init.dart';
// import 'code.dart';
// import 'decode.dart';

Future<void> main(List<String> args) async
{
	try
	{
		DateTime now = DateTime.now();
		int hour = now.hour;
		int minute = now.minute;

		String lettersLower = "qwertyuiopasdfghjklzxcvbnm";
		String lettersUpper = lettersLower.toUpperCase();
		String numbers = "1234567890";
		String special = "_@#!-*&%";

		String finalString = lettersLower + lettersUpper + numbers + special;

		// play with it here!
		switch (args[0])
		{

			case "code":

				String passwordResult = await codePass(finalString.split(""), args[1]);
				print("${bgBlue(" Coded ")}${blue("")} ${passwordResult}");
				print("${bgMagenta(" Decoded ")}${magenta("")} ${await decode(passwordResult, finalString.split(""))}");

			case "get":

				if (args[1] == "jump")
				{
					print("${bgBlack(" Jump number ")}${black("")} ${jump()}");
				}
				if (args[1] == "time")
				{
					print("${bgRed(" Time ")}${red("")} $hour:$minute");
				}
				if (args[1] == "chars")
				{
					print("${bgYellow(" Chars ")}${yellow("")}${finalString.split("")}");
				}

			case "decode":

				print("${bgMagenta(" Decoded ")}${magenta("")} ${await decode(args[1], finalString.split(""))}");

			case "help":
				print("shadowpass - the new approach to passwords (dynamic passwords depending on the time)\n\n\tcode --- code specified password that can contain letters and numbers\n\tdecode --- decode specified password that contains letters and numbers\n\tget --- get some stuff like jump number, list of allowed characters and time\n\n\targuments for get: \n\tchars --- list of allowed characters\n\ttime --- current time\n\tjump --- get the jump number");


		}
	} on RangeError catch (e)
	{
		print("You idiot! You didn't pass arguments!\n");
		print("shadowpass - the new approach to passwords (dynamic passwords depending on the time)\n\n\tcode --- code specified password that can contain letters and numbers\n\tdecode --- decode specified password that contains letters and numbers\n\tget --- get some stuff like jump number, list of allowed characters and time\n\n\targuments for get: \n\tchars --- list of allowed characters\n\ttime --- current time\n\tjump --- get the jump number");
	}
}






Future<String> codePass(List pattern, String password) async
{
	int listLength = pattern.length;

	String passwordCoded = "";

	for (String item in password.split(""))
	{
		if (pattern.indexOf(item) + jump() > pattern.length - 1)
		{
			passwordCoded += pattern[(pattern.indexOf(item) + jump() - 1) - (pattern.length - 1)];
		}
		else
		{
			passwordCoded += pattern[pattern.indexOf(item) + jump()];
		}
	}

	return passwordCoded;
}

Future<String> decode(String password, List pattern) async
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

int jump() 
{
	DateTime dateTimeNow = DateTime.now();
	int hours = dateTimeNow.hour;
	int? minutes;

	if (dateTimeNow.minute <= 30) 
	{
		minutes = 1;
	} 
	else if (dateTimeNow.minute > 30) 
	{
		minutes = 2;
	}

	// (62 - 18) - 18 * 1
	int jump = (62 - hours) - hours * minutes!;
	return jump.abs();
}