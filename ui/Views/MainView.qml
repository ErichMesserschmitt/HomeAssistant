import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.3
import "../Components"
import "../Items"

Item {
    id: root
    Background {
        anchors.fill: parent;
    }
    property int currentWidth: 0;
    readonly property int minSize: 400 //pixels

    Item {
        id: backgroundShade
        anchors.fill: parent;
        anchors.margins: root.width * 0.015
        Rectangle {
            anchors.fill: parent;
            color: Style.semiTransparentPress
            radius: Style.defaultRadius
        }
    }

    ColumnLayout {
        id: parentLayout
        anchors.fill: parent;
        anchors.margins: root.currentWidth * 0.02
        RowLayout {
            id: statusAndConnection
            Layout.fillHeight: false;
            Layout.preferredHeight: root.height * 0.1
            Layout.fillWidth: true;
            CustomButton {
                Layout.fillHeight: true;
                Layout.fillWidth: true;
                color: Qt.darker(Style.darkOrange, 1.8)
                borderColor: Qt.darker(Style.darkOrange, 1.5)
                textColor: Style.white
                fontSize: height * 0.5
                fontFamily: Style.fontMain.name
                text: "Connection Status"
            }
            CustomButton {
                Layout.fillHeight: true;
                Layout.fillWidth: false;
                Layout.preferredWidth: height
                color: Qt.darker(Style.darkOrange, 1.8)
                borderColor: Qt.darker(Style.darkOrange, 1.5)
                textColor: Style.white
                fontSize: height * 0.5
                fontFamily: Style.fontMain.name
                image: Style.bluetooth
            }
        }


        CustomButton {
            Layout.fillHeight: false;
            Layout.preferredHeight: root.height * 0.1
            Layout.fillWidth: true;
            onClicked: {
                var contentWidth = root.currentWidth - (root.currentWidth * 0.02 * 2)
                console.log("AA", contentWidth, root.minSize, contentWidth / root.minSize)
            }
        }

        GridLayout {
            id: modulesGrid
            Layout.fillHeight: true;
            Layout.fillWidth: true;
            readonly property int contentWidth: root.currentWidth - (root.currentWidth * 0.02 * 2)
            rows: blockRepeater.model / columns
            columns: contentWidth / root.minSize
            columnSpacing: 2
            onRowsChanged: {
                console.log("ROW", rows, contentWidth)
            }

            onColumnsChanged: {
                console.log("COL", columns, contentWidth)
            }

            Repeater {
                id: blockRepeater
                model: 4
                InfoBlock {
                    Layout.fillHeight: true;
                    Layout.maximumHeight: modulesGrid.contentWidth * 0.25 - (modulesGrid.columnSpacing * 3)
                    Layout.maximumWidth: modulesGrid.contentWidth * 0.25 - (modulesGrid.columnSpacing * 3)
                    Layout.minimumHeight: root.minSize
                    Layout.minimumWidth: root.minSize
                    Layout.fillWidth: false;
                    Layout.preferredWidth: height
                }
            }
        }

        Item {
            Layout.fillHeight: true;
            Layout.fillWidth: true;
        }

        CustomButton {
            Layout.fillHeight: false;
            Layout.preferredHeight: root.height * 0.1
            Layout.fillWidth: true;
            color: Qt.darker(Style.darkGrey, 1.8)
            borderColor: Qt.darker(Style.darkGrey, 1.5)
            textColor: Style.white
            fontSize: height * 0.5
            fontFamily: Style.fontMain.name
            text: "Edit"
        }
    }

}
