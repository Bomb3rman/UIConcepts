#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include "../pageplugin/pageplugin.h"
#include "woodmodel.h"

class DummyPage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.woodprofiles" FILE "woodprofiles.json")
public:
    DummyPage(QObject *parent = 0);
    ~DummyPage();

    QString getBasicInfo();
    QString getExtendedInfo();

public Q_SLOTS:
    void setModel();

private:
    WoodModel *woodModel;
};

#endif // DUMMYPAGE_H
