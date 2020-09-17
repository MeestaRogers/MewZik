import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtMultimedia 5.14

Page {
    id: songsView
    font.pointSize: 12
    property variant innerModel: null
    header: Item{
        height: 32
        width: parent.width
        DropShadow{
            anchors.fill: parent
            verticalOffset: 2
            radius: 8.0
            samples: 17
            color: "#20000000"
        }
        Rectangle{
            anchors.fill: parent
            color: Material.background
            RowLayout{
                spacing: 0
                anchors.topMargin: 10
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.fill: parent

                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: "Title"
                }

                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: "Artist"
                }

                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: "Album"
                }
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: "Genre"
                }
            }
        }
    }
    ListView {
        id: listView
        property int numColumns: 4                                              // Make this modifiable to display the information they choose
        highlightFollowsCurrentItem: true
        anchors.fill: parent
        currentIndex: -1
        model: innerModel
        spacing: 4
        highlight: Rectangle {
            color: Qt.rgba(0.0, 0.0, 0.0, 0.2)
            radius: 0
        }
        delegate: Item{
            height: 32
            width: parent.width
            RowLayout {
                spacing: 0
                anchors.topMargin: 8
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.fill: parent
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: title
                }

                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: artist
                }

                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: album
                }
                Label {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.preferredWidth: listView.width / listView.numColumns
                    text: genre
                }
            }
            MouseArea{
                anchors.fill: parent

                onClicked: {
                    player.doPlay(mewZikData.get(index).path)
                    listView.currentIndex = index
                }
            }
        }
    }
}
