#ifndef MEWZIKDATABASE_H
#define MEWZIKDATABASE_H

#include <QSqlTableModel>

class MewZikDatabase : public QSqlTableModel
{
public:
    MewZikDatabase();

//    void clear() override;
//    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
//    Qt::ItemFlags flags(const QModelIndex &index) const override;
//    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

};

#endif // MEWZIKDATABASE_H
