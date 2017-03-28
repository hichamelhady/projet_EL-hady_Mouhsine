import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4


Item {
    width: 700
    height: 700
    property alias item1: item1
    Rectangle {
        id: rectangle2
        color: "#faf8ef"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent


        Rectangle {
            id: rectangle1
            x: 45
            y: 222
            width: 450
            height: 445
            color: "#bbada0"
            scale: 1
            transformOrigin: Item.Center
        Grid {
                id: grilledujeu
                x: -1
                y: -4
                width: 452
                height: 458
                opacity: 1
                clip: false
                visible: true
                scale: 0.9
                transformOrigin: Item.Center
                rows: vuegrille.getSize();
                columns: vuegrille.getSize();
                spacing: 10

                Repeater {
                    id: modelegrille
                    model: vuegrille.getSize()*vuegrille.getSize();
                    delegate: Rectangle {
                    id:cases
                    width: 420/vuegrille.getSize();
                    height: 420/vuegrille.getSize();
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
                                if (vuegrille.state[index]!='0'){
                                    return true;
                                }
                                else { return false; }

                            }


                        }
                   }

                 }
              }

        }




        Label {
            id: label
            x: 58
            y: 63
            width: 149
            height: 64
            color: "#8c8178"
            text: qsTr("2048")
            font.pixelSize: 50
            font.family: "Arial"
            font.bold: true
            horizontalAlignment: Text.AlignLeft
            fontSizeMode: Text.Fit
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        }

        Rectangle {
            id: rectangle3
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
            x: 275
            y: 137
            width: 220
            height: 49
            color: "#8c8178"
            radius: 5
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
                  onClicked:{ vuegrille.init_grille(); }

            }
        }

        Rectangle {
            x: 275
            y: 15
            width: 220
            height: 38
            color: "#8c8178"
            radius: 5

            Text {
                id: text2
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
                color:"#ffffff"                }
        }

        Rectangle {
            id: rectangle4
            x: 501
            y: 420
            width: 192
            height: 98
            color: "#00000000"
            Item {
                id: item2
                visible: true
                anchors.fill: parent

                Image {
                    id: image
                    anchors.fill: parent
                    source: "2048_5.PNG"
                }
            }

            MouseArea {
                id: mouseArea2
                anchors.fill: parent
            }
        }

        Rectangle {
            id: rectangle5
            x: 501
            y: 563
            width: 192
            height: 98
            color: "#00000000"
            Item {
                id: item3
                visible: true

                Image {
                    id: image1
                    anchors.fill: parent
                    source: "2048_8.PNG"
                }
                anchors.fill: parent
            }

            MouseArea {
                id: mouseArea3
                anchors.fill: parent
            }
        }

        Image {
            id: image3
            x: 510
            y: 30
            width: 175
            height: 132
            source: "logo ecl.png"
        }

    }

    Rectangle {
        id: rectangle
        x: 500
        y: 273
        width: 192
        height: 98
        color: "#00000000"

        Item {
            id: item1
            anchors.fill: parent
            visible: true

            Image {
                id: image2
                anchors.fill: parent
                source: "2048_4.PNG"
            }
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
    }



}
