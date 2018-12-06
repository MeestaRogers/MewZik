#ifndef KEYVALUEMODEL_H
#define KEYVALUEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QStringList>

class MewZikDataValue
{
public:
    MewZikDataValue(const QString &artist, const QString &album,
                    const QString &genre, const QString &title);
    QString artist() const;
    QString album() const;
    QString genre() const;
    QString title() const;
private:
    QString m_artist;
    QString m_album;
    QString m_genre;
    QString m_title;
};

class MewZikDataModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum MewZikDataValueRoles{
        ArtistRole = Qt::UserRole + 1,
        AlbumRole,
        GenreRole,
        TitleRole
    };
    Q_ENUMS(MewZikDataValueRoles)
    MewZikDataModel(QObject *parent = 0);
    void addRow(const MewZikDataValue &mewZikDataValue);
    void removeAllRows();
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

    int rowCount(const QModelIndex &parent = QModelIndex()) const ;

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<MewZikDataValue> m_mewZikDataValues;

};

#endif // KEYVALUEMODEL_H
