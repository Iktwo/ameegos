import QtQuick 1.1
import com.nokia.meego 1.0

Page {

    orientationLock: PageOrientation.LockPortrait

    Rectangle {
        anchors.fill: parent

        color: "black"
    }

    ButtonStyle {
        id: greenButtonStyle

        background: "image://theme/color2-meegotouch-button-accent-background"
        pressedBackground: "image://theme/color2-meegotouch-button-accent-background-pressed"
        textColor: "black"
    }

    ButtonStyle {
        id: redButtonStyle

        background: "image://theme/color14-meegotouch-button-accent-background"
        pressedBackground: "image://theme/color14-meegotouch-button-accent-background-pressed"
        textColor: "black"
    }

    Label {
        text: "Ameegos"

        color: "white"

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: imageMeegotar.top; bottomMargin: 20
        }

        style: LabelStyle { fontPixelSize: 64 }
    }

    Image {
        id: imageMeegotar

        anchors.centerIn: parent
        source: "qrc:/images/meegotar"
    }

    Column {
        id: buttons

        width: parent.width - 150
        spacing: 20

        anchors {
            top: imageMeegotar.bottom; topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "New"

            width: parent.width

            platformStyle: greenButtonStyle

            onClicked: pageStack.push(designPage)
        }

        Button {
            text: "Quit"

            width: parent.width

            platformStyle: redButtonStyle

            onClicked: Qt.quit()
        }
    }

    DesignPage {
        id: designPage
    }

}
