#include "mewzikdata.h"
#include <QDir>
#include <QDebug>

MewZikDataValue::MewZikDataValue(const QString &artist, const QString &album,
                                 const QString &genre, const QString &title)
    : m_artist(artist), m_album(album), m_genre(genre), m_title(title)
{

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
    QStringList nameFilter("*.mp3");
    QDir directory("/Users/kevin/Music/iTunes/iTunes Media/Music/Unknown Artist/Unknown Album");
    QStringList txtFilesAndDirectories = directory.entryList(nameFilter);
    QFileInfoList fileList = directory.entryInfoList(nameFilter);

    qDebug() << directory.entryInfoList();
    qDebug() << "length" << fileList.length();
    for (int i = 0; i < fileList.length(); i++){
        qDebug() << "File: " << fileList.at(i).absoluteFilePath();
        // MewZikDataValue *t = new MewZikDataValue(txtFilesAndDirectories.at(i), "b", "c", "d");
        // addRow(*t);
    }

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
    return roles;
}
