#ifndef GESTIONJEU_H
#define GESTIONJEU_H

#include <QObject>
#include<QVector>

class gestionjeu : public QObject
{
    Q_OBJECT
public:
    explicit gestionjeu(QObject *parent = 0);
    Q_PROPERTY( QList<QString> state READ readState NOTIFY statechanged);
     QList<QString> readState();
     Q_PROPERTY(QString score READ getscore() NOTIFY scorechanged);
     QString getscore();
     Q_PROPERTY(QList<QString> couleur READ getcouleur() NOTIFY couleurchanged);
     QList<QString> getcouleur();

    ~gestionjeu();
    Q_INVOKABLE void init_grille();//initialisation de la grille 4*4
    void Randomcase();//choix d'une case au hasard pour l'initialiser au début
    bool win();
    bool gameover();
    Q_INVOKABLE void deplacementG();
    Q_INVOKABLE void deplacementD();
    Q_INVOKABLE void deplacementH();
    Q_INVOKABLE void deplacementB();


   Q_INVOKABLE  int getSize(); //grilleSize 4 ou 5(amélioration jeu)
     void setSize(int v);
    void afficher();
    static long int score_;
    static int highertile;



signals:
    void statechanged();
    void scorechanged();
    void couleurchanged();

public slots:
private:
    int grilleSize;
    int** tableau;
    QList<QString> t;
    QList<QString> C;

};

#endif //
