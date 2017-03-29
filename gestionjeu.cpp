#include "gestionjeu.h"
#include <iostream>
#include <vector>

using namespace std;
long int gestionjeu::score_=0;
int gestionjeu::highertile=0;
int gestionjeu::taille=5;

//--------------constructeur---------------

gestionjeu::gestionjeu(QObject *parent) : QObject(parent)
{
    init_grille();
    statechanged();

}

//--------------deconstructeur------------------

gestionjeu::~gestionjeu(){
    if (tableau!=NULL){
        for(int i=0;i<grilleSize;i++){
            delete [] tableau[i];
        }
        delete [] tableau;
        tableau=NULL;
    }
}

//----------------getsize-------------------

int gestionjeu::getSize(){
    return setSize(gestionjeu::taille);
}

//-----------------initialiser le jeu------------------------

void gestionjeu::init_grille(){
    gestionjeu::score_=0;
    grilleSize= getSize();
    tableau= new int*[grilleSize];
    for(int i=0;i<grilleSize;i++){
        tableau[i]= new int[grilleSize];
        for(int j=0;j<grilleSize;j++){
             tableau[i][j]=0;}
}
    //remplissage de deux cases au hasard par la valeur2;
    Randomcase();
    Randomcase();
    statechanged();
    scorechanged();
    couleurchanged();
    taillechanged();

}

//-------------------------case_remplie_au_hasard-------------------

void gestionjeu::Randomcase(){
    int i,j;
    i=rand()%grilleSize;
    j=rand()%grilleSize;
    tableau[i][j]=2;
}

//----------fonction_afficher------------

void gestionjeu::afficher(){
    cout << endl;
    for(int x=0;x<grilleSize;x++){
        for(int y=0;y<grilleSize;y++){
            cout<<tableau[x][y];
    }
    cout<<endl;

    }
    cout<<endl;
}

//--------fonction_victoire---------------

bool gestionjeu::win(){
    return highertile == 2048 ;//true if highertile =2048
}

//----fonction_gameover---------------------

bool gestionjeu::gameover(){
    int z=0;
    for(int i=0;i<grilleSize;i++){
        for(int j=0;j<grilleSize;j++){
            if(tableau[i][j]!=0)
                z++;
        }
    }
    if (z==grilleSize*grilleSize)
    return(true);
   else
    return false;
}

//----------deplacement-------------

//-----------fonction de fusion des cases

vector<int> fusionner(vector<int> v0){
    vector<int> w(v0.size());
    vector<int> v(v0.size());
    int dim=v0.size();

    int j=0;
    //-remove 0 elements
    for(int i=0;i<dim;i++){
        if(v0[i]!=0){
        v[j]=v0[i];
        j++;
        }
    }
    j=0;
    //fusionner les elements égaux
    for(int i=1;i<dim;i++){
        if(v[i-1]==v[i]){
         w[j]=2* v[i-1];
         gestionjeu::score_=gestionjeu::score_+w[j];
         if(w[j]>gestionjeu::highertile){
             gestionjeu::highertile=w[j];
         }
         i++;
         if(w[j]!=0) j++;
        }
        else{
        w[j]=v[i-1];
        j++;
        }
    }

    if ( v[dim-1]!=0){
        w[j]= v[dim-1];
        j++;
    }

//ajout 0 aux cases vides
    for(int i=j;i<dim;i++){
        w[i]=0;
    }
  return w ;
}

//----------deplacement_à_gauche---------------------

void gestionjeu::deplacementG(){
    vector<int> v1(grilleSize),v2(grilleSize);

    for(int i=0;i<grilleSize;i++){
        for(int j=0;j<grilleSize;j++){
            v1[j]=tableau[i][j];
        }
        v2=fusionner(v1);
        for(int j=0;j<grilleSize;j++){
            tableau[i][j]=v2[j];
        }
    }

//il faut ajouter une valeur dans une case vide _ if case vide ...
int i=rand()%4;
int j=rand()%4;
while (tableau[i][j]!=0){
    i=rand()%4;
    j=rand()%4;
}
tableau[i][j]=2;

    statechanged();
    scorechanged();
    couleurchanged();



}

//----------deplacement_à_droite---------------------

void gestionjeu::deplacementD(){
    vector<int> v1(grilleSize),v2(grilleSize);

    for(int i=0;i<grilleSize;i++){
        for(int j=0;j<grilleSize;j++){
            v1[grilleSize-1-j]=tableau[i][j];
        }
        v2=fusionner(v1);
        for(int j=0;j<grilleSize;j++){
            tableau[i][j]=v2[grilleSize-1-j];
        }
    }

//il faut ajouter une valeur dans une case vide _ if case vide ...
    int i=rand()%4;
    int j=rand()%4;
    while (tableau[i][j]!=0){
        i=rand()%4;
        j=rand()%4;
    }
    tableau[i][j]=2;

    statechanged();
    scorechanged();
    couleurchanged();



}

//----------deplacement_en_bas---------------------

void gestionjeu::deplacementB(){
    vector<int> v1(grilleSize),v2(grilleSize);

    for(int i=0;i<grilleSize;i++){
        for(int j=0;j<grilleSize;j++){
            v1[grilleSize-1-j]=tableau[j][i];
        }
        v2=fusionner(v1);
        for(int j=0;j<grilleSize;j++){
            tableau[j][i]=v2[grilleSize-1-j];
        }
    }
//il faut ajouter une valeur dans une case vide _ if case vide ...
    int i=rand()%4;
    int j=rand()%4;
    while (tableau[i][j]!=0){
        i=rand()%4;
        j=rand()%4;
    }
    tableau[i][j]=2;

    statechanged();
    scorechanged();
    couleurchanged();



}

//----------deplacement_en_haut---------------------

void gestionjeu::deplacementH(){
    vector<int> v1(grilleSize),v2(grilleSize);

    for(int i=0;i<grilleSize;i++){
        for(int j=0;j<grilleSize;j++){
            v1[j]=tableau[j][i];
        }
        v2=fusionner(v1);
        for(int j=0;j<grilleSize;j++){
            tableau[j][i]=v2[j];
        }
    }
//il faut ajouter une valeur dans une case vide _ if case vide ...
    int i=rand()%4;
    int j=rand()%4;
    while (tableau[i][j]!=0){
        i=rand()%4;
        j=rand()%4;
    }
    tableau[i][j]=2;

    emit statechanged();
    scorechanged();
    couleurchanged();




}

//-----------mise à jour de la taille de la grille du jeu----------------

int gestionjeu::setSize(int v){

    switch (v){
    case 4:
        gestionjeu::taille=4;
            break;
    case 5:
            gestionjeu::taille=5;
            break;
    case 6:
            gestionjeu::taille=6;
            break;
    case 7:
            gestionjeu::taille=7;
            break;
    case 8:
            gestionjeu::taille=8;
            break;
    }
    statechanged();
    return gestionjeu::taille;

}

//------ lien entre le contenu du tableau de la classe et la grille du jeu de l'interface -------------

QList<QString> gestionjeu::readState(){
     t.clear();
     for(int i=0;i<grilleSize;i++){
         for(int j=0;j<grilleSize;j++){

     t.append( QString::number(tableau[i][j]));
     }
     }
     return t;
}

//-------fonction score ---- changement de la case score de l'interface--------

QString  gestionjeu::getscore(){
     return(QString::number(gestionjeu::score_));

 }

//-----------fonction get couleur ---- changement des couleurs des cases en fonction de leur contenu

QList<QString> gestionjeu::getcouleur(){
                          C.clear();
                          for(int i=0;i<grilleSize;i++){
                              for(int j=0;j<grilleSize;j++){
                         switch (tableau[i][j]){
                         case 0 :
                             C.append( "#cbbeb1");
                             break;
                         case 2:
                              C.append("#eee4da");
                             break;
                         case 4:
                             C.append( "#eae0c8");
                             break;
                         case 8:
                              C.append( "#f59563");
                              break;
                         case 16 :
                             C.append( "#3399ff");
                             break;
                         case 32 :
                             C.append( "#ffa333");
                             break;
                         case 64 :
                             C.append( "#cef030");
                             break;
                         case 128 :
                             C.append( "#e8d8ce");
                             break;
                         case 256 :
                             C.append( "#990303");
                             break;
                         case 512 :
                             C.append( "#6ba5de");
                             break;
                         case 1024 :
                             C.append( "#dcad60");
                             break;
                         case 2048 :
                             C.append( "#b60022");
                             break;

   }
                              }
                          }
return C ;
}

