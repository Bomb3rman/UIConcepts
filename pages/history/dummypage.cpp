#include "dummypage.h"

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/history/main.qml");
}

QString DummyPage::getBasicInfo()
{
    return "History";
}

QString DummyPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

