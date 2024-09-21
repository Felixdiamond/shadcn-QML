import QtQuick
import QtQuick.Controls

Button {
    id: root

    property string variant: "default"
    property string size: "default"

    padding: size === "lg" ? 12 : size === "sm" ? 6 : 8
    topPadding: size === "default" ? 7 : padding
    bottomPadding: size === "default" ? 7 : padding
    leftPadding: size === "sm" ? 10 : size === "default" ? 13 : 16
    rightPadding: size === "sm" ? 10 : size === "default" ? 13 : 16

    implicitWidth: size === "icon" ? 40 : Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: size === "icon" ? 40 : Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding)

    background: Rectangle {
        id: buttonBackground
        radius: size === "icon" ? Math.min(root.width, root.height) / 2 : 4

        color: {
            switch(variant) {
                case "destructive": return "#944040"
                case "outline": case "icon": return "transparent"
                case "secondary": return "#333339"
                case "ghost": return "transparent"
                case "link": return "transparent"
                default: return "white" // bg-primary
            }
        }

        border {
            color: (variant === "outline" || variant === "icon") ? "#676769" : "transparent"
            width: (variant === "outline" || variant === "icon") ? 0.5 : 0
        }

        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }

    contentItem: Text {
        text: root.text
        font {
            pixelSize: size === "lg" ? 16 : size === "sm" ? 11 : 13
            weight: Font.Medium
        }
        color: {
            switch(variant) {
                case "destructive": return "#F1F5F9"
                case "outline": case "ghost": case "link": case "icon": return "white"
                case "secondary": return "white"
                default: return "#0d1012" // text-primary-foreground
            }
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    states: [
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: buttonBackground
                color: {
                    switch(variant) {
                        case "destructive": return Qt.darker("#944040", 1.1)
                        case "outline": case "ghost": case "icon": return "#333339"
                        case "secondary": return Qt.darker("#333339", 1.1)
                        case "link": return "transparent"
                        default: return Qt.darker("white", 1.1)
                    }
                }
            }
            PropertyChanges {
                target: root.contentItem
                font.underline: {
                    switch(variant) {
                        case "link": return true
                    }
                }
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: buttonBackground
                color: Qt.darker(buttonBackground.color, 1.2)
            }
        },
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root
                opacity: 0.5
            }
        }
    ]
}

