#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include "../pageplugin/pageplugin.h"

class SystemPPage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.systemparameters" FILE "systemparameters.json")
public:
    SystemPPage(QObject *parent = 0);

    QString getBasicInfo();
    QString getExtendedInfo();
};

#endif // DUMMYPAGE_H
