#ifndef WOOD_H
#define WOOD_H

#include <QString>
#include <QImage>
#include <QUrl>

class Q_DECL_EXPORT Wood
{
public:
    Wood(const QString &name, const QString &img);

    QString name() const;
    QUrl image() const;

private:
    QString m_name;
    QUrl m_img;
};
#endif // WOOD_H
