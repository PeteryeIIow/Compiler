#include <bits/stdc++.h>
using namespace std;

extern "C"{
	int yyparse(void);
}

int main(void){
    cout<<"Introduz um programa:\n";

    if (yyparse()==0) {
        cout<<"Analise concluida com sucesso.\n";
        return 0;
    }

    cout<<"Analise terminada com erros.\n";
    return 1;
}

