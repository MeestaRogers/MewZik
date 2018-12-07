import QtQuick 2.10
import QtQuick.Controls 2.3

Page {
    width: 600
    height: 400
    id: mewZikGridView
    property ListModel m_model: null
    GridView {
        id: gridView
        anchors.fill: parent
        cellWidth: 96
        anchors.leftMargin: 8
        anchors.rightMargin: 8
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
        }
        cellHeight: 128
        model: m_model
    }
}
