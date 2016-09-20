#include <cstdlib>
#include <iostream>
#include <functional> //para ahcer funciones 
#include <vector>
#include <algorithm>
using namespace std;


void ejecutaFuncion(function<void(int&)> f) {
	int a = 5;
	f(a);
}


class Filter
{
public:
	Filter() {};
	~Filter() {};

	int cont;
	int valor = 10;
	vector <int> vi{ 1,2,3,4,5,6,4 };
	vector<function<void(int&)>> v;

	//Filter v = this;
	

	void agregar() {
		auto cancer = this;
		v.push_back([=](int& a) {

			a += valor;
			cout << cancer->valor << endl;
		});
	}

	void ex() {
		int zain = 4;
		[&](int&) {
			zain += valor;
			cout << zain << endl;
		}(zain);
	}

	void imprimemelaIfEven() {
		for_each(vi.begin(), vi.end(), [=](int a) {
			if (a % 2 == 0)
				cout << a << endl;
		});
	}

};

template<class function>
void printif(function f)
{
	for_each(vi.begin(), vi.end(), f);
}

int main(void)
{
	int* z = new int(2);
	int a = 1;
	auto f = [=](int& b)mutable {
		cout << b << endl << *z << endl << a << endl;
	};
	delete(z);
	ejecutaFuncion(f);
	/*
		si paso z por referencia con el delete antes de la llamada a la funcion, el programa crashea
		actualmente ocmo copia el valor de NULL, imprime ese valor
	*/

	Filter kuz;
	kuz.ex();
	kuz.agregar();
	/*
	kuz.printif([=](int a) {
		if (a > 5)
			cout << a << endl;
	});
	*/

	system("PAUSE");
	return 0;
}

/*
lambas ocn paramtros constantes

[] (int a) { cout << a;}(8);

para modificar el valor

function<int (int 2)>f =[](int &a) mutable {
	a = 10;
	return 10;
}(a);

auto f = ...
auto decide que regresa y que recibe de tipo de datos

para tener parametros del exterior

int a  = 1;
[a](int &b) mutable {
a = 10;
return 10;
}(b);
en el corchete ponemos la varable local
[=] // por valor, todas las variables del contexto



*/