import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4


Item {
    id: item1
    width: 710
    height: 700
   Rectangle {
        id: rectanglegrilledujeu
        color: "#faf8ef"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent


        Rectangle {
                id: rectangle1
                y: 200
                width: 480
                height: 480
                color: "#bbada0"
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                scale: 1
                transformOrigin: Item.Center

       Grid {
                id: grilledujeu
                anchors.fill: parent

                opacity: 1
                clip: false
                visible: true
                scale: 0.9
                transformOrigin: Item.Center
                rows: vuegrille.taille
                columns: vuegrille.taille
                spacing: 10
                Repeater {
                    id: modelegrille
                    model: vuegrille.taille*vuegrille.taille;
                    anchors.fill: parent
                    delegate: Rectangle {
                        id:cases
                        width: 430/vuegrille.taille;
                        height: 430/vuegrille.taille;
                        radius: 5
                        color: vuegrille.couleur[index];
                        Text{
                            id:remplissage
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.family: "Tahoma"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 40
                            focus: true
                            //text : index
                            text: vuegrille.state[index]
                            visible : {
                                if (vuegrille.state[index]!=='0')
                                    return true;

                                else  return false;

                            }


                      Behavior on text {
                            PropertyAnimation { target: cases
                                property: "opacity"
                                from: 0.5
                                to: 1
                                duration: 300
                            }
                        }
                        }

                        property int moveAnimTime: 300
                        property int newTileAnimTime: 600
                        property bool runNewTileAnim: false
                        ParallelAnimation {
                                running: runNewTileAnim
                                NumberAnimation {
                                    target: cases
                                    property: "opacity"
                                    from: 0.0
                                    to: 1.0
                                    duration: newTileAnimTime
                                }

                                ScaleAnimator {
                                    target: cases
                                    from: 0
                                    to: 1
                                    duration: newTileAnimTime
                                    easing.type: Easing.OutQuad
                                }
                            }

                               }

                 }
              }

        }
}


    Label {
            id: logo2048
            width: 149
            height: 64
            color: "#8c8178"
            text: qsTr("2048")
            anchors.left: parent.left
            anchors.leftMargin: 60
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 40
            font.pixelSize: 50
            font.family: "Arial"
            font.bold: true
            fontSizeMode: Text.Fit
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

    Rectangle {
            id: rectangle_score
            x: 275
            y: 68
            width: 220
            height: 55
            radius: 5
            color: "#bbada0"
            Text{
                text:vuegrille.score
                width: 176
                anchors.centerIn: parent
                visible: true
                scale: 1
                wrapMode: Text.NoWrap
                horizontalAlignment: Text.AlignHCenter
                textFormat: Text.RichText
                font.pixelSize: 26
                font.bold: false
                color:"#ffffff"
            }

        }


   Rectangle {
            id:recatngle_recommencer
            width: 172
            height: 50
            color: "#8c8178"
            radius: 5
            anchors.top: parent.top
            anchors.topMargin: 115
            anchors.left: parent.left
            anchors.leftMargin: 50
            Text{
                width: 176
                anchors.centerIn: parent
                text: qsTr("Recommencer")
                visible: true
                scale: 1
                wrapMode: Text.NoWrap
                horizontalAlignment: Text.AlignHCenter
                textFormat: Text.RichText
                font.pixelSize: 26
                font.bold: false
                color:"#ffffff"


            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                  onClicked:{
                      vuegrille.init_grille();
                  }
            }
       }


    Rectangle {
            id:rectangelscoree
            x: 275
            y: 15
            width: 220
            height: 38
            color: "#8c8178"
            radius: 5

            Text {
                width: 197
                height: 31
                anchors.centerIn: parent
                text: qsTr("Score")
                visible: true
                scale: 1
                wrapMode: Text.NoWrap
                horizontalAlignment: Text.AlignHCenter
                textFormat: Text.RichText
                font.pixelSize: 26
                font.bold: false
                color:"#ffffff"
            }
        }

    Rectangle {
        id:choix_4x4cases
        x: 600
        y: 180
        width: 80
        height: 80
        color: "#8c8178"
        Text {
            width: 197
            height: 31
            anchors.centerIn: parent
            text: qsTr("4")
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 26
            font.bold: false
            color:"#ffffff"                }
        Item {
            id: item2
            visible: true
            anchors.fill: parent
        }

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            onClicked:{
                vuegrille.setSize(4);
                vuegrille.init_grille();
            }
        }
    }

    Rectangle {
        id:choix_5x5cases
        x: 550
        y: 280
        width: 80
        height: 80
        color: "#8c8178"
        Text {
            width: 197
            height: 31
            anchors.centerIn: parent
            text: qsTr("5")
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 26
            font.bold: false
            color:"#ffffff"                }
        Item {
            id: item3
            visible: true
            anchors.fill: parent
        }

        MouseArea {
            id: mouseArea3
            anchors.fill: parent
            onClicked:{
                vuegrille.setSize(5);
                vuegrille.init_grille();
            }
        }
    }

    Rectangle {
        id:choix_6x6cases
        x: 600
        y: 380
        width: 80
        height: 80
        color: "#8c8178"
        Text {
            width: 197
            height: 31
            anchors.centerIn: parent
            text: qsTr("6")
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 26
            font.bold: false
            color:"#ffffff"                }
        Item {
            id: item4
            visible: true
            anchors.fill: parent
        }

        MouseArea {
            id: mouseArea4
            anchors.fill: parent
            onClicked:{
                vuegrille.setSize(6);
                vuegrille.init_grille();
            }
        }
    }

    Rectangle {
        id:choix_7x7cases
        x: 550
        y: 480
        width: 80
        height: 80
        color: "#8c8178"
        Text {
            width: 197
            height: 31
            anchors.centerIn: parent
            text: qsTr("7")
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 26
            font.bold: false
            color:"#ffffff"                }
        Item {
            id: item6
            visible: true
            anchors.fill: parent
        }

        MouseArea {
            id: mouseArea6
            anchors.fill: parent
            onClicked:{
                vuegrille.setSize(7);
                vuegrille.init_grille();
            }
        }
    }

    Rectangle {
        id:choix_8x8cases
        x: 600
        y: 580
        width: 80
        height: 80
        color: "#8c8178"
        Text {
            width: 197
            height: 31
            anchors.centerIn: parent
            text: qsTr("8")
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 26
            font.bold: false
            color:"#ffffff"                }
        Item {
            id: item7
            visible: true
            anchors.fill: parent

        }

        MouseArea {
            id: mouseArea7
            anchors.fill: parent
            onClicked:{
                vuegrille.setSize(8);
                vuegrille.init_grille();
            }
        }
    }

    Label {
            id: choixtaille
            width: 700
            height: 80
            x:250
            y:150
            color: "#8c8178"
            text: qsTr("Choisissez la taille de la grille du jeu !")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 13
            font.family: "Calibri"
            font.bold: true
            fontSizeMode: Text.Fit
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }


}

