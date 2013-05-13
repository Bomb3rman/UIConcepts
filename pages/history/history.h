#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include "../pageplugin/pageplugin.h"
#include <QAbstractItemModel>

class HistoryPage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.history" FILE "history.json")
public:
    HistoryPage(QObject *parent = 0);

    QString getBasicInfo();
    QString getExtendedInfo();
    QString getDocumentation();

public Q_SLOTS:
    void setModel();

private:
    QAbstractItemModel *m_historyModel;
};

#endif // DUMMYPAGE_H
