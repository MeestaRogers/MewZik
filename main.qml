import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import MewZikData 1.0
import "icon.js" as Mdi
ApplicationWindow {
    id: app
    visible: true
    width: 640
    height: 480
    title: qsTr("MewZik")
    MewZikData{
        id: mewZikData
    }
    FontLoader { id: webFont; source: "qrc:/materialdesignicons-webfont.ttf" }
    header: ToolBar{
        id:playbackControls
        Row{
            ToolButton{
                font.family: webFont.name
                font.pixelSize: 24
                Material.background: Material.accent
                text: Mdi.Icon.skipPrevious
                visible: app.width >= 640
            }
            ToolButton{
                font.family: webFont.name
                font.pixelSize: 24
                Material.background: Material.accent
                text: Mdi.Icon.skipBackward
                visible: app.width >= 640
            }
            ToolButton{
                font.family: webFont.name
                font.pixelSize: 24
                Material.background: Material.accent
                text: Mdi.Icon.play
                visible: true
            }
            ToolButton{
                font.family: webFont.name
                font.pixelSize: 24
                Material.background: Material.accent
                text: Mdi.Icon.skipForward
                visible: app.width >= 640
            }
            ToolButton{
                font.family: webFont.name
                font.pixelSize: 24
                Material.background: Material.accent
                text: Mdi.Icon.skipNext
                visible: app.width >= 640
            }
        }
    }
    /**
      * Use a swipe view as our main container to switch between list view,
      * grid view (to show artist stacks or an album grid), and another view to
      * represent podcasts or other media based content
      */
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        SongsView {
        }
        AlbumView {
        }
        ArtistsView {
        }
        PodcastsView {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            font.family: webFont.name
            font.pixelSize: 24
            Material.background: Material.accent
            text: Mdi.Icon.viewList
        }
        TabButton {
            font.family: webFont.name
            font.pixelSize: 24
            Material.background: Material.accent
            text: Mdi.Icon.album
        }
        TabButton {
            font.family: webFont.name
            font.pixelSize: 24
            Material.background: Material.accent
            text: Mdi.Icon.account
        }
        TabButton {
            font.family: webFont.name
            font.pixelSize: 24
            Material.background: Material.accent
            text: Mdi.Icon.audiobook
        }
    }
}
