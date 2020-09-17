#include "mewzikplayer.h"

#include <QTime>
MewZikPlayer::MewZikPlayer(QObject *parent) : QMediaPlayer(parent)
{

}

void MewZikPlayer::doPlay(QString media){
    this->setMedia(QUrl::fromLocalFile(media));
    this->play();
}
