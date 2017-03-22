#include "gestionjeu.h"
#include <iostream>
using namespace std;

gestionjeu::gestionjeu(QObject *parent) : QObject(parent)
{
    init_grille();
    statechanged();

}

//initialiser le jeu

void gestionjeu::init_grille(){
    score_=0;
    highertile=0;
    for(int i=0;i<4;i++){
        for(int j=0;j<4;j++){
             tableau[i][j]=0;}
}
    Randomcase();
    Randomcase();
}


void gestionjeu::Randomcase(){
    int i,j;
    i=rand()%4;
    j=rand()%4;
    tableau[i][j]=2;
}


void gestionjeu::afficher(){
    cout << endl;
    for(int x=0;x<4;x++){
        for(int y=0;y<4;y++){
            cout<<tableau[x][y];
    }
    cout<<endl;

    }
    cout<<endl;
}


bool gestionjeu::win(){
    return highertile == 2048 ;
}


QList <QString> gestionjeu::readState(){

   for(int i=0;i<4;i++){
       for(int j=0;j<4;j++){

       t.append(QString::number(tableau[i][j]));
       }
   }
   return t;
}




/*
bool gestionjeu::deplacementH(){
    return deplacement(H);
}

bool gestionjeu::deplacementG(){
    return deplacement(G);
}

bool gestionjeu::deplacementD(){
    return deplacement(D);
}

bool gestionjeu::deplacementB(){
    return deplacement(B);
}

bool gestionjeu::gameover(){

}

bool gestionjeu::deplacement(directions direction){

}

  */
