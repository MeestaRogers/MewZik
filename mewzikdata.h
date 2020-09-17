#ifndef KEYVALUEMODEL_H
#define KEYVALUEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QStringList>
#include <QDir>

class MewZikDataValue
{
public:
    MewZikDataValue(const QString &path, const QString &artist, const QString &album,
                    const QString &genre, const QString &title);
    QString path() const;
    QString artist() const;
    QString album() const;
    QString genre() const;
    QString title() const;
    QString date() const;
    QString composer() const;
    QString image() const;
    QString time() const;
private:
    QString m_path;
    QString m_artist;
    QString m_album;
    QString m_genre;
    QString m_title;
    QString m_date;
    QString m_composer;
    QString m_image;
    QString m_time;
};

class MewZikDataModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum MewZikDataValueRoles{
        ArtistRole = Qt::UserRole + 1,
        AlbumRole,
        GenreRole,
        TitleRole,
        PathRole,
        ImageRole,
        DateRole,
        ComposerRole,
        TimeRole
    };
    Q_ENUMS(MewZikDataValueRoles)
    Q_INVOKABLE QVariantMap get(int row);
    MewZikDataModel(QObject *parent = 0);
    void addRow(const MewZikDataValue &mewZikDataValue);
    void removeAllRows();
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

    int rowCount(const QModelIndex &parent = QModelIndex()) const ;

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<MewZikDataValue> m_mewZikDataValues;
    void iterateDirs(QDir dir);

};

#endif // KEYVALUEMODEL_H
