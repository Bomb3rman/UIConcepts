#include "history.h"
#include <QQmlContext>
#include "../../datahandling/datahandling.h"

HistoryPage::HistoryPage(QObject *parent) :
    PagePlugin(parent)
{
    m_componentUrl.setUrl("qrc:/history/main.qml");
    m_historyModel = Datahandling::createHistoryModel();
    connect(this, SIGNAL(engineChanged()), this, SLOT(setModel()), Qt::DirectConnection);
}

QString HistoryPage::getBasicInfo()
{
    return "History";
}

QString HistoryPage::getExtendedInfo()
{
    return "ExtendedInfo\nMore Info\nnoch mehr";
}

QString HistoryPage::getDocumentation()
{
    return "Documentation for HistoryPage";
}

void HistoryPage::setModel()
{
    qDebug() << "Setting history model";
    m_engine->rootContext()->setContextProperty("historyModel", m_historyModel);
}

