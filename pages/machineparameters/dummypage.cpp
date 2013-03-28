#include "dummypage.h"

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/machineparameters/main.qml");
}

QString DummyPage::getBasicInfo()
{
    return "Machine Parameters";
}

QString DummyPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

