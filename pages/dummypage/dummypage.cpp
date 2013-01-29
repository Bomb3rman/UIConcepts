#include "dummypage.h"

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/dummypage/main.qml");
}

QString DummyPage::getBasicInfo()
{
    return "BasicInfo";
}

QString DummyPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info";
}

