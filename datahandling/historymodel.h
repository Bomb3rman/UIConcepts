#ifndef HISTORYMODEL_H
#define HISTORYMODEL_H

#include <QAbstractListModel>
#include <QDateTime>
#include <QStringList>

class Q_DECL_EXPORT HistoryElement
{
public:
    HistoryElement(const QString &plank, const QString &text, const QDateTime start, const QDateTime end);

    QString plank() const;

    QString text() const;
    QStringList getCorrections() const;
    QDateTime start() const;
    QDateTime end() const;
    void addCorrection(QString correction);

private:
    QString m_plank;
    QString m_text;
    QDateTime m_start;
    QDateTime m_end;
    QStringList m_corrections;
};

class HistoryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum HistoryRoles {
        PlankRole = Qt::UserRole + 1,
        TextRole,
        CorrectionsRole,
        StartRole,
        EndRole
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
