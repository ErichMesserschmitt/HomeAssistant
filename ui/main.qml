import QtQuick 2.12
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.3
import "Components"
import "Views"

Window {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height


    StackView {
        anchors.fill: parent;
        StartWindow {
            anchors.fill: parent;
            visible: _appController ? !_appController.isInitialized : false;
        }
        MainView {
            anchors.fill: parent;
            currentWidth: width
            visible: _appController ? _appController.isInitialized : false;
        }
    }
}
