#ifndef WOOD_H
#define WOOD_H

#include <QString>
#include <QImage>
#include <QUrl>

class Q_DECL_EXPORT Wood
{
public:
    Wood(const QString &name);

    QString name() const;

private:
    QString m_name;
    float velocity;
    float quality;
    float weight;

};
#endif // WOOD_H
