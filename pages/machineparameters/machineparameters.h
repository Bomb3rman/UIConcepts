#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include "../pageplugin/pageplugin.h"
#include "../../datahandling/parametermodel.h"

class MachinePage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.dummypage" FILE "machineparameters.json")
public:
    MachinePage(QObject *parent = 0);

    QString getBasicInfo();
    QString getExtendedInfo();

public Q_SLOTS:
    void setModel();
    void setAntialiasing();

private:
    QAbstractItemModel *m_model;
};

#endif // DUMMYPAGE_H
