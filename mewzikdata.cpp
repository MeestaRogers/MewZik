#include "mewzikdata.h"
#include <QDir>
#include <QFileInfo>
#include <QDebug>
#include <taglib/tag.h>
#include <taglib/fileref.h>

void MewZikDataModel::iterateDirs(QDir dir){
    if(dir.exists()){
        QStringList filters;
        filters << "*.mp3" << "*.wav";
        dir.setNameFilters(filters);
        foreach(QFileInfo info, dir.entryInfoList(QDir::NoDotAndDotDot | QDir::Files | QDir::AllDirs)){
            if(info.isFile()){
                QString title = info.fileName().remove(".mp3");
                title = title.remove(".wav");
                TagLib::FileRef f(info.filePath().toStdString().c_str());
                TagLib::Tag *t = f.tag();
                if(t->title().length() > 0){
                    title = t->title().toCString();
                }
                QString artist = t->artist().toCString();
                if(artist.length() == 0)
                    artist = "Unknown";
                QString album = t->album().toCString();
                if(album.length() == 0)
                    album = "Unknown";
                QString genre = t->genre().toCString();
                if(genre.length() == 0)
                    genre = "Unknown";
                MewZikDataValue v(info.filePath(), artist, album, genre, title);
                this->addRow(v);
            } else if (info.isDir()){
                QDir nextDir(info.filePath());
                this->iterateDirs(nextDir);
            }
        }
    }
}

MewZikDataValue::MewZikDataValue(const QString &path, const QString &artist, const QString &album,
                                 const QString &genre, const QString &title)
    : m_path(path), m_artist(artist), m_album(album), m_genre(genre), m_title(title)
{

}
QString MewZikDataValue::path() const
{
    return m_path;
}
QString MewZikDataValue::artist() const
{
    return m_artist;
}
QString MewZikDataValue::album() const
{
    return m_album;
}
QString MewZikDataValue::genre() const
{
    return m_genre;
}
QString MewZikDataValue::title() const
{
    return m_title;
}
QString MewZikDataValue::date() const
{
    return m_date;
}
QString MewZikDataValue::composer() const
{
    return m_composer;
}
QString MewZikDataValue::image() const
{
    return m_image;
}
QString MewZikDataValue::time() const
{
    return m_time;
}
/**
 * @brief MewZikDataModel::MewZikDataModel
 * When initializing the data structure we'll have a database in theory that
 * will index the library on startup (based on a setting). Currently using
 * an absolute path to where music exists on a local machine for testing.
 * Database will be in place in due time. The database will do all the filtering
 * of files that we wish to include in the library whether it be *.wav, *.mp3,
 * *.mp4 etc.
 * This abstract list model will be bound to UI for listing the content the user
 * has chosen to include within their library.
 * @param parent
 */
MewZikDataModel::MewZikDataModel(QObject *parent) : QAbstractListModel(parent)
{
    QDir dir("/Users/kevin/Music");
    iterateDirs(dir);
}

void MewZikDataModel::addRow(const MewZikDataValue &dataValue)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_mewZikDataValues << dataValue;
    endInsertRows();
}

int MewZikDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_mewZikDataValues.count();
}
void MewZikDataModel::removeAllRows()
{
    beginResetModel();
    m_mewZikDataValues.clear();
    endResetModel();
}
QVariantMap MewZikDataModel::get(int row){
    QHash<int,QByteArray> names = roleNames();
    QHashIterator<int, QByteArray> i(names);
    QVariantMap res;
    while (i.hasNext()) {
        i.next();
        QVariant data = index(row, 0).data(i.key());
        res[i.value()] = data;
    }
    return res;
}

/**
 * @brief MewZikDataModel::data
 * This overridden method is a list model that a ListView will use to display
 * the content library.
 * @param index         The index in the database to present content info
 * @param role          The role of which data to present. Artist, Genre etc.
 * @return
 */
QVariant MewZikDataModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();
    const MewZikDataValue &mewZikDataValue = m_mewZikDataValues[index.row()];
    if(role == ArtistRole){
        return mewZikDataValue.artist();
    }else if(role == AlbumRole){
        return mewZikDataValue.album();
    }else if(role == GenreRole){
        return mewZikDataValue.genre();
    }else if(role == TitleRole){
        return mewZikDataValue.title();
    }else if(role == PathRole){
        return mewZikDataValue.path();
    }else if(role == ComposerRole){
        return mewZikDataValue.composer();
    }else if(role == ImageRole){
        return mewZikDataValue.image();
    }
    return QVariant();
}

QHash<int, QByteArray> MewZikDataModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ArtistRole] = "artist";
    roles[AlbumRole] = "album";
    roles[GenreRole] = "genre";
    roles[TitleRole] = "title";
    roles[PathRole] = "path";
    return roles;
}
