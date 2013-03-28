#include "dummypage.h"

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/woodprofiles/main.qml");
}

QString DummyPage::getBasicInfo()
{
    return "Woodprofiles";
}

QString DummyPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

