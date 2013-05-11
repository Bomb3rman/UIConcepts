#include <dummypage.h>

DummyPage::DummyPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/dummypage/main.qml");
}

QString DummyPage::getBasicInfo()
{
    return "BasicInfo....";
}

QString DummyPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

QString DummyPage::getDocumentation()
{
    return "This is the documentation for the dummy page.\n"
            "A lot of useful information can be stored here\n\n"
            "....really";
}
