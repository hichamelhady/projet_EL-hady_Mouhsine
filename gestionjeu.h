#ifndef GESTIONJEU_H
#define GESTIONJEU_H

#include <QObject>
#include<QVector>

class gestionjeu : public QObject
{
    Q_OBJECT
public:
    explicit gestionjeu(QObject *parent = 0);
    Q_PROPERTY(QList <QString> state READ readState NOTIFY statechanged)
    QList <QString> readState();

    void init_grille();//initialisation de la grille 4*4
    void Randomcase();//choix de case au hasard pour l'initialiser au début
    bool win();
    bool gameover();
    bool deplacementG();
    bool deplacementD();
    bool deplacementH();
    bool deplacementB();
    int countEmptycells() const;

    enum directions{
        H=8,
        B=2,
        G=4,
        D=6
    };

    bool deplacement(directions direction);
    int score();
    void afficher();
    int get(int x, int y);


signals:
    void statechanged();
    void scorechanged();

public slots:
private:
    int tableau[4][4];
    long int score_;
    int highertile;
    QList <QString> t;

};

#endif //
