import QtQuick
import QtQuick.Controls

Rectangle {
    id: button
    width: size === "lg" ? 140 : size === "sm" ? 90 : 120
    height: size === "lg" ? 50 : size === "sm" ? 35 : 40
    radius: size === "icon" ? width / 2 : 6
    color: variant === "destructive" ? "#F87171" :
           variant === "outline" ? "transparent" :
           variant === "secondary" ? "#6B7280" :
           variant === "ghost" ? "transparent" :
           variant === "link" ? "transparent" :
           "#2563EB" // default (bg-primary)

    border.color: variant === "outline" ? "#D1D5DB" : "transparent"
    border.width: variant === "outline" ? 1 : 0

    property string variant: "default"
    property string size: "default"
    property bool disabled: false
    property string buttonText: "Click Me"

    signal clicked

    Text {
        id: textItem
        text: buttonText
        anchors.centerIn: parent
        color: variant === "destructive" ? "#F1F5F9" :
               variant === "outline" ? "#374151" :
               variant === "secondary" ? "#E5E7EB" :
               variant === "ghost" ? "#374151" :
               variant === "link" ? "#2563EB" :
               "#FFFFFF" // default (text-primary-foreground)
        font.pixelSize: size === "lg" ? 18 : size === "sm" ? 14 : 16
        font.bold: true
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            if (!button.disabled) {
                button.clicked()
            }
        }

        onEntered: {
            if (!button.disabled) {
                button.color = variant === "destructive" ? "#DC2626" :
                               variant === "outline" ? "#F3F4F6" :
                               variant === "secondary" ? "#4B5563" :
                               variant === "ghost" ? "#F3F4F6" :
                               variant === "link" ? "#2563EB" :
                               "#1D4ED8" // hover-primary
            }
        }

        onExited: {
            if (!button.disabled) {
                button.color = variant === "destructive" ? "#F87171" :
                               variant === "outline" ? "transparent" :
                               variant === "secondary" ? "#6B7280" :
                               variant === "ghost" ? "transparent" :
                               variant === "link" ? "transparent" :
                               "#2563EB" // default
            }
        }
    }

    states: [
        State {
            name: "disabled"
            when: button.disabled
            PropertyChanges {
                target: textItem
                color: "#9CA3AF"
            }
            PropertyChanges {
                target: button
                opacity: 0.5
            }
        }
    ]

    Behavior on color {
        NumberAnimation {
            duration: 150
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 150
        }
    }
}

