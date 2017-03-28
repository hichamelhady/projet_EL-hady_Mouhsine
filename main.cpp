#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "gestionjeu.h"
#include <time.h>
#include <QtQml>
#include<iostream>
using namespace std;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    gestionjeu nouveaujeu;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("vuegrille", &nouveaujeu);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

   /* cout<<"grille initiale"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementG();
    cout<<"deplacement gauche"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementB();
    cout<<"deplacement bas"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementB();
    cout<<"deplacement bas"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementH();
    cout<<"deplacement haut"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementG();
    cout<<"deplacement gauche"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementD();
    cout<<"deplacement droite"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementH();
    cout<<"deplacement haut"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementD();
    cout<<"deplacement à droite"<<endl;
    nouveaujeu.afficher();
    nouveaujeu.deplacementH();
    cout<<"deplacement haut"<<endl;
    nouveaujeu.afficher();
*/
    nouveaujeu.afficher();
    cout<<endl<< gestionjeu::score_<<endl;

    return app.exec();

}
