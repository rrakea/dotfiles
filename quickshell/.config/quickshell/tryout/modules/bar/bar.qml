import QtQuick
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: panel

    implicitHeight: 40

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 8
        left: 8
        right: 8
    }

    Rectangle {
        id: bar

        anchors.fill: parent
        radius: 15
        color: "transparent"
        border.color: "#333333"
        border.width: 3

        Row {
            id: workspacesRow

            spacing: 8

            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 16
            }

            Repeater {
                model: Hyprland.workspaces

                Rectangle {
                    width: 30
                    height: 20
                    color: modelData.active ? "#444444" : "#333333"
                    radius: 4
                    border.color: "#555555"
                    border.width: 2

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Hyprland.dispatch("workspace " + modelData.id)
                    }

                    Text {
                        text: modelData.id
                        anchors.centerIn: parent
                        color: modelData.active ? "#ffffff" : "#cccccc"
                        font.pixelSize: 12
                        font.family: "Inter, sans-serif"
                    }

                }
            }

        }

    }

}
