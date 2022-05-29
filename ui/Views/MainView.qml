import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.2
import QtQuick.Dialogs
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
        RowLayout {
            Layout.fillHeight: false;
            Layout.preferredHeight: root.height * 0.1
            Layout.fillWidth: true;
            Repeater {
                model: 4
                CustomButton {
                    Layout.fillHeight: true;
                    Layout.fillWidth: true;
                    text: "Room" + index
                }
            }
            CustomButton {
                Layout.fillHeight: true;
                Layout.fillWidth: true;
                text: "+"
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
                    Layout.minimumHeight: root.minSize
                    Layout.minimumWidth: root.minSize
                    Layout.fillWidth: true;
                    Layout.preferredWidth: height
                }
            }
        }

        Item {
            Layout.fillHeight: true;
            Layout.fillWidth: true;
        }

        RowLayout {
            Layout.fillHeight: false;
            Layout.preferredHeight: root.height * 0.1
            Layout.fillWidth: true;
            CustomButton {
                Layout.fillHeight: true;
                Layout.fillWidth: true;
                color: Qt.darker(Style.darkGrey, 1.8)
                borderColor: Qt.darker(Style.darkGrey, 1.5)
                textColor: Style.white
                fontSize: height * 0.5
                fontFamily: Style.fontMain.name
                text: "Edit"
            }
            CustomButton {
                Layout.fillHeight: true;
                Layout.fillWidth: false;
                Layout.preferredWidth: height
                borderColor: Qt.darker(Style.darkGrey, 1.5)
                color: Style.red
                image: Style.trashcan
            }
        }
    }

}
