import QtQuick
import QtQuick.Controls

Label {
    id: root

    property alias text: labelText.text
    property alias font: labelText.font
    property alias color: labelText.color
    property alias enabled: labelText.enabled

    // Default styles for the label
    font.pixelSize: 12
    font.weight: Font.Medium
    color: enabled ? "#000000" : "#A0A0A0"
    opacity: enabled ? 1 : 0.7

    Text {
        id: labelText
        text: root.text
        anchors.centerIn: parent
    }
}
