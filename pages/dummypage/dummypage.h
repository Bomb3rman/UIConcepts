#ifndef DUMMYPAGE_H
#define DUMMYPAGE_H

#include "../pageplugin/pageplugin.h"

class DummyPage : public PagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.project.dummypage" FILE "dummypage.json")
public:
    DummyPage();
};

#endif // DUMMYPAGE_H
