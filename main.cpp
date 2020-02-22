#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QFileInfo>
#include <QMediaMetaData>
#include <QMediaObject>
#include <QMediaPlayer>
#include <QMediaContent>
#include <QMediaService>
#include <QDebug>
#include "mewzikdata.h"

QMediaPlayer *player;

void metaDataChanged(){
    qDebug() << player->availableMetaData();
}

void iterateMyDir(QDir dir){
    if(dir.exists()){
        QStringList filters;
        filters << "*.mp3" << "*.wav";
        dir.setNameFilters(filters);
        foreach(QFileInfo info, dir.entryInfoList(QDir::NoDotAndDotDot | QDir::Files | QDir::AllDirs)){
            if(info.isFile()){
                player->setMedia(QUrl::fromLocalFile(info.filePath()));
                player->play();
                qDebug() << player->availableMetaData();

            } else if (info.isDir()){
                QDir nextDir(info.filePath());
                iterateMyDir(nextDir);
            }
        }
    }
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    player = new QMediaPlayer();
    QDir dir("C:/Users/krog8/Desktop");
    iterateMyDir(dir);
    qDebug("Done Scanning directories.");

    qmlRegisterType<MewZikDataModel>("MewZikData", 1, 0, "MewZikData");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
