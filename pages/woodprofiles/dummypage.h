#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include "../pageplugin/pageplugin.h"
#include <../../datahandling/woodmodel.h>

class WoodProfilesPage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.woodprofiles" FILE "woodprofiles.json")
public:
    WoodProfilesPage(QObject *parent = 0);
    ~WoodProfilesPage();

    QString getBasicInfo();
    QString getExtendedInfo();

public Q_SLOTS:
    void setModel();

private:
    WoodModel *woodModel;
};

#endif // DUMMYPAGE_H
