#include <cstdlib>
#include <iostream>

using namespace std;

class Foo
{
public:
	Foo(int nval=0):val(nval){cout << "default constructor"<<endl;};
	~Foo()=default;

	Foo& operator=(const Foo& foo)
	{
		cout << "const copy assigment "<<endl;;
		return *this;
	}
	
	Foo(const Foo& foo)
	{
		cout << "copy consttructor"<<endl;
	}
	
	Foo getFoo()
	{
		return *this;
	}

	private:
	int val;
};

int main (void)
{
	Foo a;
	Foo b;
	Foo c(a);
	b = a;
	Foo d =b;
	Foo e = b.getFoo();
	Foo f (c.getFoo());
	return 0; 
}