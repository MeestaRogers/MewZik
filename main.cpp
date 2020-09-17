#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mewzikdata.h"
#include "mewzikplayer.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<MewZikDataModel>("MewZikData", 1, 0, "MewZikData");
    qmlRegisterType<MewZikPlayer>("MewZikPlayer", 1, 0, "MewZikPlayer");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
