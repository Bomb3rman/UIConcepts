#ifndef PARAMETERMODEL_H
#define PARAMETERMODEL_H

#include <QAbstractListModel>

class Q_DECL_EXPORT ParameterElement
{
public:
    ParameterElement(const QString &name, const QString &type, const QString &value, const QString &group);
    ParameterElement(const QString &name, const QVariant &value, const QString &group);

    QString name() const;
    QString type() const;
    QVariant value() const;
    QString group() const;
private:
    QString m_name;
    QVariant m_value;
    QString m_type;
    QString m_group;
};

class Q_DECL_EXPORT ParameterModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ParameterModel(QObject *parent = 0);

    enum ParameterRoles {
        NameRole = Qt::UserRole + 1,
        ValueRole,
        TypeRole,
        GroupRole
    };

    void addParameter(const ParameterElement &element);

    void setGroup(QString group);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<ParameterElement> m_completeList;
    QList<ParameterElement> m_currentList;

    QString currentGroup;
    
};

#endif // PARAMETERMODEL_H
