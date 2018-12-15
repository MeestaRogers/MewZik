import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3

Page {
    id: songsView
    font.pointSize: 12
    header: Item{
        height: 24
        width: parent.width
        RowLayout{
            spacing: 0
            anchors.topMargin: 4
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            anchors.fill: parent
            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / listView.numColumns
                text: "title"
            }

            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / listView.numColumns
                text: "artist"
            }

            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / listView.numColumns
                text: "album"
            }
            Label {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                Layout.preferredWidth: listView.width / listView.numColumns
                text: "genre"
            }
        }
    }
    ListView {
        id: listView
        property int numColumns: 4                                              // Make this modifiable to display the information they choose
        highlightFollowsCurrentItem: true
        anchors.fill: parent
        currentIndex: -1
        model: libraryModel
        spacing: 4
        highlight: Rectangle {
            color: Qt.rgba(0.0, 0.0, 0.0, 0.2)
            radius: 0
        }
        delegate: Item{
            height: 24
            width: parent.width
            RowLayout {
                spacing: 0
                anchors.topMargin: 4
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
                    if(listView.currentIndex == index)
                        console.log("Playing current selection")
                    else
                        listView.currentIndex = index
                }
            }
        }
    }
    // Bind the list model to our MewZik Data class
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
