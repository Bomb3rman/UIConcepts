#include "parametermodel.h"
#include "xmlaccess.h"
#include <QDebug>

ParameterElement::ParameterElement(const QString &name, const QString &type, const QString &value,const QString &group) :
    m_name(name), m_type(type), m_group(group)
{
    if (type == "int") {
        m_value = QVariant(value.toInt());
    } else if (type == "string") {
        m_value = QVariant(value);
    } else if (type == "bool") {
        m_value = QVariant((bool)value.toInt());
    }
}

ParameterElement::ParameterElement(const QString &name, const QVariant &value,const QString &group) :
    m_name(name), m_value(value), m_group(group)
{
    if (value.type() == QVariant::Bool)
        m_type = "bool";
    else if (value.type() == QVariant::Int)
        m_type = "int";
    else if (value.type() == QVariant::String)
        m_type = "string";
}

QString ParameterElement::name() const
{
    return m_name;
}

QVariant ParameterElement::value() const
{
    return m_value;
}

QString ParameterElement::type() const
{
    return m_type;
}

QString ParameterElement::group() const
{
    return m_group;
}

ParameterModel::ParameterModel(QObject *parent) :
    QAbstractListModel(parent)
{
#if defined(USE_XML)
    XMLAccess::readParameters(this);
#else
#endif
    setGroup("");
}


void ParameterModel::addParameter(const ParameterElement &element)
{
    m_completeList.append(element);
    setGroup(currentGroup);
}

void ParameterModel::setGroup(QString group) {
    currentGroup = group;
    beginResetModel();
    m_currentList.clear();
    foreach (ParameterElement param, m_completeList) {
        if (param.group() == group || group.isEmpty()) {
            m_currentList.append(param);
        }
    }
    endResetModel();
}

int ParameterModel::rowCount(const QModelIndex & parent) const
{
    Q_UNUSED(parent)
    qDebug() << "Querying current list size" << m_currentList.size();
    return m_currentList.size();
}

QVariant ParameterModel::data(const QModelIndex & index, int role) const
{
    if (index.row() < 0 || index.row() >= m_currentList.count())
        return QVariant();

    const ParameterElement &element = m_currentList[index.row()];
    if (role == NameRole)
        return element.name();
    else if (role == ValueRole)
        return element.value();
    else if (role == TypeRole)
        return element.type();
    else if (role == GroupRole)
        return element.group();
    return QVariant();
}

QHash<int, QByteArray> ParameterModel::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[ValueRole] = "value";
    roles[TypeRole] = "type";
    roles[GroupRole] = "group";
    return roles;
}
