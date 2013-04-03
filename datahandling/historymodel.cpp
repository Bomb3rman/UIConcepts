#include <historymodel.h>
#include <QDebug>
#include <xmlaccess.h>

HistoryModel::HistoryModel(QObject *parent)
    : QAbstractListModel(parent)
{
#if defined(USE_XML)
#else
#endif
}

void HistoryModel::addElement(const HistoryElement &element)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_history << element;
    endInsertRows();
    qDebug() << "Inserting wood into model" << element.name();
}

int HistoryModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent)
    return m_history.count();
}

QVariant HistoryModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_history.count())
        return QVariant();

    const HistoryElement &element = m_history[index.row()];
    if (role == NameRole)
        return element.name();
    else if (role == TextRole)
        return element.text();
    return QVariant();
}

QHash<int, QByteArray> HistoryModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[TextRole] = "text";
    return roles;
}

