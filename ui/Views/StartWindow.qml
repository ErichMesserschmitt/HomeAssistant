import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.3
import "../Components"

Item {
    Background {
        anchors.fill: parent;
    }
    Text {
        anchors.fill: parent;
        font.family: Style.fontMain.name
        color: Style.black
        text: "Home Assistant"
        font.pixelSize: parent.height * 0.2
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
    }
}
