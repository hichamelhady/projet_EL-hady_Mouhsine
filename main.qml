import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 710
    height: 700
    title: qsTr("Jeu 2048")


ExclusiveGroup { id: taillegroup }
    menuBar: MenuBar {
        Menu {
            title: qsTr("Fichier")
            MenuItem {
                text: qsTr("Nouveau jeu")
                shortcut: "Ctrl+N"
                onTriggered: vuegrille.init_grille();

            }
            MenuItem {
                text: qsTr("Fermer")
                onTriggered: Qt.quit();
            }
        }

        Menu
        {
            title: qsTr("?")
            MenuItem {
                text: qsTr("à propos")
                onTriggered:aboutDialog.open()


            }

        }

    }


    MainForm {
        anchors.fill: parent
        focus: true



        Keys.onPressed: {
          switch (event.key) {
            case Qt.Key_Up:
              vuegrille.deplacementH();
                console.log("fleche haut") //vérification_signal_reçu

              break;
            case Qt.Key_Down:
              vuegrille.deplacementB();
              break;
            case Qt.Key_Left:
              vuegrille.deplacementG();
              break;
            case Qt.Key_Right:
              vuegrille.deplacementD();
              break;
          }
            if (vuegrille.gameover()===true)
            jeuterminé.open();
            if (vuegrille.win()===true)
                jeugangé.open();

        }

}

    MessageDialog {
        id: aboutDialog
        title: qsTr("About 2048-Qt")
        Text{
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Tahoma"
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 24
            text: qsTr("Yasmine&Hicham 2017")
    }
        standardButtons: StandardButton.Ok
    }

    MessageDialog {
        id: jeuterminé
        title: qsTr("Game Over")
        text: qsTr("malhereusement vous avez perdu!")
        standardButtons: StandardButton.Retry | StandardButton.Abort
        onAccepted: {
            vuegrille.init_grille();

        }
        onRejected:Qt.quit();
    }
    MessageDialog {
        id: jeugagné
        title: qsTr("jeu Gagné")
        text: qsTr("vous avez gagné!")
        standardButtons: StandardButton.Retry | StandardButton.Abort
        onAccepted: {
            vuegrille.init_grille();

        }
        onRejected:Qt.quit();
    }
}


