#ifndef PAGEPLUGIN_H
#define PAGEPLUGIN_H

#include <QObject>
#include <qqmlengine.h>
#include <QQmlComponent>
#include <QQuickItem>
#include <QDebug>

#if defined(PAGEPLUGIN_LIBRARY)
#  define PagePlugin_DLL Q_DECL_EXPORT
#else
#  define PagePlugin_DLL Q_DECL_IMPORT
#endif

class PagePlugin_DLL PagePlugin : public QObject
{
    Q_OBJECT
public:
    explicit PagePlugin(QObject *parent = 0);
    ~PagePlugin();

    void setEngine(QQmlEngine *engine);

    QQuickItem *getQQuickItem();
    virtual QString getBasicInfo() { return QString(); }
    virtual QString getExtendedInfo() {return QString(); }
    virtual QString getDocumentation() {return QString(); }
    
signals:
    void engineChanged();
    
public slots:

protected:
    QUrl m_componentUrl;
    QQuickItem *m_item;
    QQmlEngine *m_engine;
};

#endif // PAGEPLUGIN_H
