#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include <../pageplugin/pageplugin.h>

class MachinePPage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.dummypage" FILE "machineparameters.json")
public:
    MachinePPage(QObject *parent = 0);

    QString getBasicInfo();
    QString getExtendedInfo();
};

#endif // DUMMYPAGE_H
