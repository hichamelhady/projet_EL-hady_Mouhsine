#include "gestionjeu.h"
#include <iostream>
#include <vector>

using namespace std;
long int gestionjeu::score_=0;
int gestionjeu::highertile=0;


gestionjeu::gestionjeu(QObject *parent) : QObject(parent)
{
    init_grille();
    statechanged();

}

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
    return 4; //grilleSize ;
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
    bool test=false;
    for(int i=0;i<grilleSize;i++){
        for(int j=0;j<grilleSize;j++){
            if(tableau[i][j]==0)
                test=true;
        }
    }
    return(test);
}

//----------deplacement-------------
/*
appel des fct G,H,D,B et mise à jr score
*/
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
    bool test =0;

    for(int i=1;i<dim;i++){
        if(v[i-1]==v[i]){
         test=1;
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
  //  if(test==0 && j==dim-1){ w[j]=v[dim-1];j++;}

    //ajout 0 aux cases vides
    for(int i=j;i<dim-1;i++){
        w[i]=0;

    }
  return w ;
}

//----------deplacement_à_gauche---------------------
vector<int> fusionner(vector<int> v);

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
//-----------setsize----------------

//------lien tableau et la grille d'interface -------------
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
//-----------fonction get couleur ---- changement des couleurs des cases
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

