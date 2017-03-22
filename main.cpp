#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "gestionjeu.h"
#include <time.h>
#include <QtQml>


int main(int argc, char *argv[])
{
   QGuiApplication app(argc, argv);
   gestionjeu nouveaujeu;
   // srand(time(NULL));
    //nouveaujeu.init_grille();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("grille", &nouveaujeu);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    nouveaujeu.afficher();

    return app.exec();

    //gestionjeu jeu;

}
