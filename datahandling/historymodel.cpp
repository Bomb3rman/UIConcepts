#include "historymodel.h"
#include <QDebug>
#include "xmlaccess.h"

HistoryElement::HistoryElement(const QString &plank, const QString &text, const QDateTime start, const QDateTime end) :
    m_plank(plank), m_text(text), m_start(start), m_end(end)
{
}

QString HistoryElement::plank() const
{
    return m_plank;
}

QString HistoryElement::text() const
{
    return m_text;
}

QStringList HistoryElement::getCorrections() const
{
    return m_corrections;
}

QDateTime HistoryElement::start() const
{
    return m_start;
}

QDateTime HistoryElement::end() const
{
    return m_end;
}

void HistoryElement::addCorrection(QString correction)
{
    m_corrections << correction;
}

HistoryModel::HistoryModel(QObject *parent)
    : QAbstractListModel(parent)
{
#if defined(USE_XML)
    XMLAccess::readHistory(this);
#else
#endif
}

void HistoryModel::addElement(const HistoryElement &element)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_history << element;
    endInsertRows();
}

int HistoryModel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent)
    return m_history.count();
}

QVariant HistoryModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_history.count())
        return QVariant();

    const HistoryElement &element = m_history[index.row()];
    if (role == PlankRole)
        return element.plank();
    else if (role == TextRole)
        return element.text();
    else if (role == CorrectionsRole)
        return element.getCorrections();
    else if (role == StartRole)
        return element.start();
    else if (role == EndRole)
        return element.end();
    return QVariant();
}

QHash<int, QByteArray> HistoryModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[PlankRole] = "plank";
    roles[TextRole] = "text";
    roles[CorrectionsRole] = "corrections";
    roles[StartRole] = "start";
    roles[EndRole] = "end";
    return roles;
}

