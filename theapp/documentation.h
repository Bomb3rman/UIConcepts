#ifndef DOCUMENTATION_H
#define DOCUMENTATION_H

#include <QObject>

class Documentation : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool visible READ isVisible WRITE setVisible NOTIFY visibleChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

public:
    explicit Documentation(QObject *parent = 0);
    bool isVisible() const;
    QString text() const;
    
Q_SIGNALS:
    void visibleChanged();
    void textChanged();
    
public Q_SLOTS:
    void setVisible(bool visible);
    void setText(QString text);

private:
    bool m_visible;
    QString m_text;
};

#endif // DOCUMENTATION_H
