import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Page {
    id: songsView
    font.pointSize: 12
    ListView {
        id: listView
        highlightFollowsCurrentItem: true
        anchors.fill: parent
        currentIndex: -1
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        model: libraryModel
        spacing: 4
        highlight: Rectangle {
            color: Material.accent
            radius: 0
        }
        delegate: RowLayout {
            property var columnWidths: ListView.view.columnWidths
            spacing: 0
            height: 24
            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                text: title
            }

            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                text: artist
            }

            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                text: album
            }
            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                text: genre
            }
        }
    }
    ListModel {
        id: libraryModel
        ListElement {
            title: "A Masterpiece"
            artist: "Gabriel"
            album: "Voila"
            genre: "Metal"
        }
        ListElement {
            title: "Brilliance"
            artist: "Jens"
            album: "heavy heavy"
            genre: "Metal"
        }
        ListElement {
            title: "Outstanding"
            artist: "Frederik"
            album: "Boom Band"
            genre: "Metal"
        }
    }
}
