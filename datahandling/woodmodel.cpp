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
}

void WoodModel::addProfile(QString name)
{
    Wood wood(name);
    addProfile(wood);
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
        return QVariant::fromValue(wood.defects());
    }
    return QVariant();
}

bool WoodModel::saveDefect(int id, int defectId, QString name, QString type,
                            QString threshold, QString description)
{
    if (id == -2) {
        //addProfile(Wood(name, defects));
        return true;
    }
    if (id < 0 || id >= rowCount())
        return false;

    m_wood.at(id).defects().at(defectId)->setProperty("name", name);
    m_wood.at(id).defects().at(defectId)->setProperty("type", type);
    m_wood.at(id).defects().at(defectId)->setProperty("threshold", threshold);
    m_wood.at(id).defects().at(defectId)->setProperty("description", description);
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

QObject *WoodModel::getDefect(int row, int index)
{
    if (row < 0 || index <0  || row > m_wood.count()-1
            || index > m_wood.at(row).defects().count()-1) {
        qWarning() << "Defect request out of bounds" << row << index;
        return 0;
    }
    return m_wood.at(row).defects().at(index);
}

QHash<int, QByteArray> WoodModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[DefectsRole] = "defects";
    return roles;
}

