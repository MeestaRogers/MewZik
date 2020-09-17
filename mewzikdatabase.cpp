#include "mewzikdatabase.h"

MewZikDatabase::MewZikDatabase()
{

}

QVariant MewZikDatabase::headerData(int section, Qt::Orientation orientation, int role) const {
    return QVariant();
}

Qt::ItemFlags MewZikDatabase::flags(const QModelIndex &index) const {
    return 0;
}

QVariant MewZikDatabase::data(const QModelIndex &index, int role) const {
    return QVariant();
}

void MewZikDatabase::clear(){

}
