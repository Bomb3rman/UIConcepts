#ifndef DARKCOMPONENTS_H
#define DARKCOMPONENTS_H

#include <QQuickItem>

class DarkComponents : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(DarkComponents)
    
public:
    DarkComponents(QQuickItem *parent = 0);
    ~DarkComponents();
};

QML_DECLARE_TYPE(DarkComponents)

#endif // DARKCOMPONENTS_H

