import QtQuick 2.10
import QtQuick.Controls 2.3

MewZikGridView{
    id: artistsView
    m_model: ListModel {
        ListElement {
            title: "Grey"
            m_image: "grey"
        }
    }
}
