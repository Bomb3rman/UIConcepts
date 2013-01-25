#ifndef PAGEPLUGIN_H
#define PAGEPLUGIN_H

#include <QObject>
#include <qqmlengine.h>
#include <QQmlComponent>
#include <QQuickItem>
#include <QDebug>

class PagePlugin : public QObject
{
    Q_OBJECT
public:
    explicit PagePlugin(QObject *parent = 0);
    ~PagePlugin();

    void setEngine(QQmlEngine *engine);

    QQuickItem *getQQuickItem();
    
signals:
    
public slots:

protected:
    QUrl m_componentUrl;
    QQuickItem *m_item;
};

#endif // PAGEPLUGIN_H
