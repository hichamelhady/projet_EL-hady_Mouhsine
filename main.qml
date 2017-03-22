import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 540
    height: 700
    title: qsTr("Jeu 2048")

    menuBar: MenuBar {
        Menu {
            title: qsTr("Fichier")
            MenuItem {
                text: qsTr("Nouveau jeu")
                onTriggered: console.log("Open action triggered");
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


            }
            MenuItem {
                text: qsTr("à propos de QT")

            }
        }

    }


    MainForm {
        anchors.fill: parent
    }


}
