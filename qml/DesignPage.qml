import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    orientationLock: PageOrientation.LockPortrait

    property int headIndex: 1
    property int eyeIndex: 1
    property int mouthIndex: 1

    property int maxHead: 30
    property int maxEye: 30
    property int maxMouth: 13

    property bool bigHead: !(headIndex % 2)

    function randomize() {
        headIndex = Math.floor((Math.random() * maxHead) + 1)
        eyeIndex = Math.floor((Math.random() * maxEye) + 1)
        mouthIndex = Math.floor((Math.random() * maxMouth) + 1)
    }

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

    Item {
        id: controls

        anchors.fill: parent

        Button {
            anchors {
                left: parent.left; leftMargin: 30
                top: parent.top; topMargin: 150
            }

            height: 80
            width: 80

            text: "<"

            onClicked: {
                if (eyeIndex > 2)
                    eyeIndex--
                else
                    eyeIndex = maxEye
            }
        }

        Button {
            anchors {
                right: parent.right; rightMargin: 30
                top: parent.top; topMargin: 150
            }

            height: 80
            width: 80

            text: ">"

            onClicked: {
                if (eyeIndex < maxEye)
                    eyeIndex++
                else
                    eyeIndex = 1
            }
        }

        Button {
            anchors {
                left: parent.left; leftMargin: 30
                top: parent.top; topMargin: 350
            }

            height: 80
            width: 80

            text: "<"

            onClicked: {
                if (headIndex > 2)
                    headIndex--
                else
                    headIndex = maxHead
            }
        }

        Button {
            anchors {
                right: parent.right; rightMargin: 30
                top: parent.top; topMargin: 350
            }

            height: 80
            width: 80

            text: ">"

            onClicked: {
                if (headIndex < maxHead)
                    headIndex++
                else
                    headIndex = 1
            }
        }

        Button {
            anchors {
                left: parent.left; leftMargin: 30
                top: parent.top; topMargin: 550
            }

            height: 80
            width: 80

            text: "<"

            onClicked: {
                if (mouthIndex > 2)
                    mouthIndex--
                else
                    mouthIndex = maxMouth
            }
        }

        Button {
            anchors {
                right: parent.right; rightMargin: 30
                top: parent.top; topMargin: 550
            }

            height: 80
            width: 80

            text: ">"

            onClicked: {
                if (mouthIndex < maxMouth)
                    mouthIndex++
                else
                    mouthIndex = 1
            }
        }
    }

    Item {
        id: avatar

        anchors.fill: parent

        Image {
            id: headImage

            anchors.centerIn: parent

            source: "qrc:/heads/" + headIndex
        }

        Image {
            id: eyeImage

            anchors {
                horizontalCenter: parent.horizontalCenter
                top: headImage.top; topMargin: bigHead ? (height < 20 ? 22 : 18) : (height < 20 ? 25 : 22)
            }

            source: "qrc:/eyes/" + eyeIndex
        }

        Item {
            width: 56
            height: 50

            anchors {
                right: headImage.right; rightMargin: bigHead ? 19 : 28
                bottom: headImage.bottom; bottomMargin: 5
            }

            Image {
                id:  mouthImage

                anchors {
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }

                source: "qrc:/mouth/" + mouthIndex
            }
        }

    }

    Button {
        text: "Random"

        anchors {
            bottom: parent.bottom; bottomMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        platformStyle: greenButtonStyle

        onClicked: randomize()
    }
}
