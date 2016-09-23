#include <cstdlib>
#include <string>
#include <iostream>
#include <algorithm>
#include <functional>

using namespace std;

bool doble(int x);
bool triple(int x);
bool quad(int x);
bool quin(int x);

auto f = [](int d , int x) {
	string kuz = to_string(d);
	string zain = to_string(x);
	for each (char c in zain)
	{
		if (kuz.length() != zain.length())
			return false;
		if (kuz.find(c) != string::npos)
			continue;
		else
			return false;
	}
	return true;
};


int main(void)
{
	bool found = false;
	int tutzke = 1;
	while (!found)
	{
		if (doble(tutzke) && triple(tutzke) && quad(tutzke) && quin(tutzke))
		{
			found = true;
			cout << "el menor de los numeros con doble y triple y cuadruple y quintuple con los mismos digitos es: " << tutzke << endl;
			cout << "el doble es " << tutzke * 2 << "\nel triple " << tutzke * 3 << "\nel cuadruple" << tutzke * 4 << "\nel quitntuple " << tutzke * 5<<endl;
		}

		++tutzke;
		if (tutzke > 999999)
		{
			break;
		}
	}

	
	system("PAUSE");
	return 0;
}

bool doble(int x)
{
	int d;
	d = x * 2;
	return f(d, x);
}


bool triple(int x)
{
	int d;
	d = x * 3;
	return f(d, x);
}

bool quad(int x)
{
	int d;
	d = x * 4;
	return f(d, x);
}

bool quin(int x)
{
	int d;
	d = x * 5;
	return f(d, x);
}