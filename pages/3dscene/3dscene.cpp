#include "3dscene.h"

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/3dscene/main.qml");
}

QString DummyPage::getBasicInfo()
{
    return "3D Scene";
}

QString DummyPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

