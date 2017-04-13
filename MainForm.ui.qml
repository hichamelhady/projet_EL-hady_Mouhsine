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

        Image {
            id: image
            x: 539
            y: 8
            width: 137
            height: 119
            source: "logo ecl.png"
        }


        Image {
            id: image1
            x: 66
            y: 104
            width: 120
            height: 64
            source: "retour.png"
        }
    }


    Label {
        id: logo2048
        width: 152
        height: 71
        color: "#8c7878"
        text: qsTr("2048")
        textFormat: Text.RichText
        renderType: Text.QtRendering
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 54
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        anchors.topMargin: 32
        font.pixelSize: 55
        font.family: "Arial"
        font.bold: true
        fontSizeMode: Text.Fit
        wrapMode: Text.WordWrap
    }

    Rectangle {
        id: rectangle_score
        x: 275
        y: 63
        width: 220
        height: 40
        radius: 2
        color: "#bbada0"
        Text{
            text:vuegrille.score
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 28
            font.bold: false
            color:"#ffffff"
        }

    }


    Rectangle {
        id:recatngle_recommencer
        y: 125
        width: 220
        height: 40
        color: "#8c8178"
        radius: 2
        anchors.top: parent.top
        anchors.topMargin: 121
        anchors.left: parent.left
        anchors.leftMargin: 275
        Text{
            text: qsTr("Recommencer")
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 28
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
        y: 8
        width: 220
        height: 40
        color: "#8c8178"
        radius: 2

        Text {
            text: qsTr("Score")
            anchors.fill: parent
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 28
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
            text: qsTr("4")
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 32
            font.bold: true
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
            text: qsTr("5")
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 32
            font.bold: true
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
            text: qsTr("6")
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 32
            font.bold: true
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
            text: qsTr("7")
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 32
            font.bold: true
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
            text: qsTr("8")
            font.family: "Tahoma"
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.fill: parent
            visible: true
            scale: 1
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font.pixelSize: 32
            font.bold: true
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
        width: 213
        height: 24
        x:501
        y:137
        color: "#8c7878"
        text: qsTr("Choisissez la taille de la grille du jeu !")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        font.family: "Calibri"
        font.bold: true
        fontSizeMode: Text.Fit
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }


}
