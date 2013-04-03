#include "dummypage.h"

SystemPPage::SystemPPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/systemparameters/main.qml");
}

QString SystemPPage::getBasicInfo()
{
    return "System parameters";
}

QString SystemPPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

