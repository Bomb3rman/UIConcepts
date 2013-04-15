#ifndef DOCUMENTATION_H
#define DOCUMENTATION_H

#include <QObject>

class Documentation : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool visible READ isVisible WRITE setVisible NOTIFY visibleChanged)

public:
    explicit Documentation(QObject *parent = 0);
    bool isVisible() const;
    
Q_SIGNALS:
    void visibleChanged();
    
public Q_SLOTS:
    void setVisible(bool visible);

private:
    bool m_visible;
    
};

#endif // DOCUMENTATION_H
