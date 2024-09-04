import 'dart:async';

int jump() 
{
	DateTime dateTimeNow = DateTime.now();
	int hours = dateTimeNow.hour;
	int? minutes;

	// if its first half of (incoming) hour
	// or just if actual minutes are lower than 30..
	if (dateTimeNow.minute <= 30) 
	{
		// do this!
		minutes = 1;
	} 
	//if its second half 
	// or just minutes are higher than 30 (so its second half of hour)
	else if (dateTimeNow.minute > 30)
	{
		// do this bullshit!
		minutes = 2;
	}

	// finally! calculate the jump int
	int jump = (62 - hours) - hours * minutes!;

	// and return it!
	return jump.abs();
}
