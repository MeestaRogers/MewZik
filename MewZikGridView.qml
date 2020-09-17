import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import QtGraphicalEffects 1.0
Page {
    id: mewZikGridView
    property ListModel m_model: null
    GridView {
        id: gridView
        anchors.fill: parent
        cellWidth: 96
        cellHeight: 96
        model: m_model
        currentIndex: -1
        highlight: Rectangle {
            width: gridView.cellWidth
            height: gridView.cellHeight
            color: Qt.rgba(0.0, 0.0, 0.0, 0.2)
            radius: 8
        }
        anchors.leftMargin: 8
        anchors.rightMargin: 0
        anchors.topMargin: 24
        delegate: Item {
            height: 96
            width: 96
            Column {
//                spacing: 8
                anchors.centerIn: parent
                Rectangle {
                    width: 72
                    height: 72
                    radius: 8
                    color: m_image
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                DropShadow{
                    id: shadow
                    z: -1
                    verticalOffset: 2
                    radius: 8.0
                    samples: 17
                    color: "#20000000"
                }
                Text {
                    text: title
                    font.bold: true
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            MouseArea {
                id: mouseArea
                hoverEnabled: true
                anchors.fill: parent
                onClicked: {
                    gridView.currentIndex = index
                }
                onHoveredChanged: {
                    shadow.visible = mouseArea.hoverEnabled
                }
            }
        }
    }
}
