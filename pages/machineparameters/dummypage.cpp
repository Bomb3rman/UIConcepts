#include "dummypage.h"

MachinePPage::MachinePPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/machineparameters/main.qml");
}

QString MachinePPage::getBasicInfo()
{
    return "Machine Parameters";
}

QString MachinePPage::getExtendedInfo()
{
    return "Machine is on\nblabla\nblablabla";
}

