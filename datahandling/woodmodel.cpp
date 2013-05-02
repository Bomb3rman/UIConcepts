#include "woodmodel.h"
#include <QDebug>
#include "xmlaccess.h"

WoodModel::WoodModel(QObject *parent)
    : QAbstractListModel(parent), m_activeProfile(-1)
{
#if defined(USE_XML)
    XMLAccess::readProfilesXML(this);
#else

#endif
}

void WoodModel::addProfile(const Wood &wood)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_wood << wood;
    endInsertRows();
    qDebug() << "Inserting wood into model" << wood.name();
}

int WoodModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent)
    return m_wood.count();
}

QVariant WoodModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_wood.count())
        return QVariant();

    const Wood &wood = m_wood[index.row()];
    if (role == NameRole)
        return wood.name();
    else if (role == DefectsRole) {
        qDebug() << "Returning defects" << wood.defects().count();
        return QVariant::fromValue(wood.defects());
    }
    return QVariant();
}

bool WoodModel::saveProfile(int id, QString name, QList<QObject*> defects)
{
    if (id == -2) {
        addProfile(Wood(name, defects));
        return true;
    }
    if (id < 0 || id >= rowCount())
        return false;

    m_wood[id] = Wood(name, defects);
    Q_EMIT dataChanged(index(id), index(id));

#if defined(USE_XML)
    XMLAccess::saveProfilesXML(this);
#endif
    return true;
}

int WoodModel::activeProfile()
{
    return m_activeProfile;
}

void WoodModel::setActiveProfile(int id)
{
    m_activeProfile = id;
    Q_EMIT activeProfileChanged();
}

QHash<int, QByteArray> WoodModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[DefectsRole] = "defects";
    return roles;
}

