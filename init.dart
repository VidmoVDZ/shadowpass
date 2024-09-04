import 'dart:async';

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
