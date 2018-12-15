import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
Page {
    id: mewZikGridView
    property ListModel m_model: null
    GridView {
        id: gridView
        anchors.fill: parent
        cellWidth: 104
        currentIndex: -1
        highlight: Rectangle {
            color: Qt.rgba(0.0, 0.0, 0.0, 0.2)
            radius: 0
        }
        anchors.leftMargin: 8
        anchors.rightMargin: 0
        anchors.topMargin: 24
        delegate: Item {
            height: 96
            width: 96
            Column {
                spacing: 8
                anchors.centerIn: parent
                Rectangle {
                    width: 96
                    height: 96
                    color: m_image
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: title
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridView.currentIndex = index
                }
            }
        }
        cellHeight: 128
        model: m_model
    }
}
