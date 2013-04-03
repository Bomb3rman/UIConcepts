#ifndef HISTORYMODEL_H
#define HISTORYMODEL_H

#include <QAbstractListModel>

class Q_DECL_EXPORT HistoryElement
{
public:
    HistoryElement(const QString &name, const QString &text);

    QString name() const;

    QString text() const;

private:
    QString m_name;
    QString m_text;
};

class HistoryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum HistoryRoles {
        NameRole = Qt::UserRole + 1,
        TextRole
    };

    HistoryModel(QObject *parent = 0);

    void addElement(const HistoryElement &element);

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<HistoryElement> m_history;
};

#endif // HISTORYMODEL_H
