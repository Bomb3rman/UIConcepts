#include "dummypage.h"

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/systemparameters/main.qml");
}

QString DummyPage::getBasicInfo()
{
    return "System parameters";
}

QString DummyPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

