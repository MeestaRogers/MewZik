import QtQuick 2.10
import QtQuick.Controls 2.3

// import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Page {
    font.pointSize: 4

    //    TableView {
    //        id: tableView
    //        anchors.fill: parent

    //        TableViewColumn {
    //            role: "title";
    //            title: "Title";
    //            width: tableView.viewport.width / tableView.columnCount
    //        }
    //        TableViewColumn {
    //            role: "artist";
    //            title: "Artist";
    //            width: tableView.viewport.width / tableView.columnCount
    //        }
    //        TableViewColumn {
    //            role: "album";
    //            title: "Album";
    //            width: tableView.viewport.width / tableView.columnCount
    //        }
    //        TableViewColumn {
    //            role: "genre";
    //            title: "Genre";
    //            width: tableView.viewport.width / tableView.columnCount
    //        }
    //        model: libraryModel
    //    }
    ListView {
        id: listView
        anchors.fill: parent
        model: libraryModel
        delegate: RowLayout {

            property var columnWidths: ListView.view.columnWidths
            spacing: 0
            height: 24

            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                //                Layout.preferredWidth: columnWidths.name
                //                background: Rectangle { border.color: "red" }
                text: title
            }

            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                //                Layout.preferredWidth: columnWidths.code
                //                background: Rectangle { border.color: "green" }
                text: artist
            }

            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                //                Layout.preferredWidth: columnWidths.language
                //                background: Rectangle { border.color: "blue" }
                text: album
            }
            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / 4
                // Layout.preferredWidth: columnWidths.language
                // background: Rectangle { border.color: "blue" }
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
