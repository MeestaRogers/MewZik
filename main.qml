import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import MewZikData 1.0
import MewZikPlayer 1.0
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
    MewZikPlayer{
        id: player
        onStateChanged: {
            playButton.text = player.state === MewZikPlayer.PlayingState ? Mdi.Icon.pause : Mdi.Icon.play ;
        }
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
                onPressedChanged: {
                    if(pressed){
                        skipBackwardTimer.start()
                    } else {
                        skipBackwardTimer.stop()
                    }
                }
                Timer{
                    id: skipBackwardTimer
                    interval: 100
                    repeat: true
                    onTriggered: {
                        player.setPosition(player.position - (player.duration/500))
                    }
                }
            }
            ToolButton{
                id: playButton
                font.family: webFont.name
                font.pixelSize: 24
                Material.background: Material.accent
                text: Mdi.Icon.play
                visible: true
                onClicked: {
                    if(player.media){
                        player.state === MewZikPlayer.PlayingState ? player.pause() : player.play() ;
                    }
                }
            }
            ToolButton{
                font.family: webFont.name
                font.pixelSize: 24
                Material.background: Material.accent
                text: Mdi.Icon.skipForward
                visible: app.width >= 640
                onPressedChanged: {
                    if(pressed){
                        skipForwardTimer.start()
                    } else {
                        skipForwardTimer.stop()
                    }
                }
                Timer{
                    id: skipForwardTimer
                    interval: 100
                    repeat: true
                    onTriggered: {
                        player.setPosition(player.position + (player.duration/500))
                    }
                }
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
            innerModel: mewZikData
        }
        AlbumView {
        }
        ArtistsView {
        }
        PodcastsView {
        }
    }

    footer: Column{
        width: parent.width
        Row{
            width: parent.width
            ToolBar{
                width: parent.width
                Row{
                    anchors.fill: parent

                    Column{
                        width: 64
                        Label{
                            text: player.position //Qt.formatTime(player.position)
                            onTextChanged: {
                                console.log("Time: " + Qt.formatTime(new Date(player.position).toISOString().substr(11, 8)))
                            }
                        }
                    }
                    Column{
                        width: parent.width - 128
                        Slider{
                            id: slider
                            width: parent.width
                            value: {
                                if(!slider.pressed){
                                    player.position / player.duration
                                } else {
                                    slider.value
                                }
                            }
                            onPressedChanged: {
                                if(!slider.pressed){
                                    player.setPosition(slider.value * player.duration)
                                }
                            }
                        }
                    }
                    Column{
                        width: 64
                        Label{
                            text: player.duration //Qt.formatTime(player.duration - player.position)
                        }
                    }
                }
            }
        }
        Row{
            width: parent.width
            TabBar {
                width: parent.width
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
    }
}
