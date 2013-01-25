#include "dummypage.h"

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/dummypage/main.qml");
}
