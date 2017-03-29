#ifndef GESTIONJEU_H
#define GESTIONJEU_H

#include <QObject>
#include<QVector>

class gestionjeu : public QObject
{
    Q_OBJECT

public:

    explicit gestionjeu(QObject *parent = 0);

    //état des grilles de l'interface

    Q_PROPERTY( QList<QString> state READ readState NOTIFY statechanged);
    QList<QString> readState();

    //état de la case score de l'interface

    Q_PROPERTY(QString score READ getscore() NOTIFY scorechanged);
    QString getscore();

    //changement des couleurs des cases

    Q_PROPERTY(QList<QString> couleur READ getcouleur() NOTIFY couleurchanged);
    QList<QString> getcouleur();

    //changement de la taille des cases de l'interface

    Q_PROPERTY(int taille READ getSize() NOTIFY taillechanged);
    int getSize();

    ~gestionjeu();

    Q_INVOKABLE void init_grille();//initialisation de la grille 4*4
    void Randomcase();//choix d'une case au hasard pour l'initialiser au début
    Q_INVOKABLE bool win();
    Q_INVOKABLE bool gameover();
    Q_INVOKABLE void deplacementG();
    Q_INVOKABLE void deplacementD();
    Q_INVOKABLE void deplacementH();
    Q_INVOKABLE void deplacementB();
    Q_INVOKABLE  int setSize(int v);
    void afficher();
    static long int score_;
    static int highertile;
    static int taille;

signals:

    void statechanged();
    void scorechanged();
    void couleurchanged();
    void taillechanged();

public slots:
private:
    int grilleSize;
    int** tableau;
    QList<QString> t;
    QList<QString> C;

};

#endif //
