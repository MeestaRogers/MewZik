#ifndef MEWZIKPLAYER_H
#define MEWZIKPLAYER_H

#include <QObject>
#include <QMediaPlayer>

class MewZikPlayer : public QMediaPlayer
{
    Q_OBJECT
public:
    explicit MewZikPlayer(QObject *parent = nullptr);

    Q_INVOKABLE void doPlay(QString media);

signals:

public slots:
protected:
    //QMediaPlayer *player;
};

#endif // MEWZIKPLAYER_H
