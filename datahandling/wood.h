#ifndef WOOD_H
#define WOOD_H

#include <QString>
#include <QImage>
#include <QUrl>

class Q_DECL_EXPORT Wood
{
public:
    Wood(const QString &name, const QImage &img);

    QString name() const;
    QImage image() const;

private:
    QString m_name;
    QImage m_img;
};
#endif // WOOD_H
