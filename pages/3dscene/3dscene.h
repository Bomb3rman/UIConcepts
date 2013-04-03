#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include <../pageplugin/pageplugin.h>

class Scene3DPage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.dummypage" FILE "dummypage.json")
public:
    Scene3DPage(QObject *parent = 0);

    QString getBasicInfo();
    QString getExtendedInfo();
};

#endif // DUMMYPAGE_H
