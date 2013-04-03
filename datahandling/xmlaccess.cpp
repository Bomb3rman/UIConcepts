#include "xmlaccess.h"
#include <QDir>
#include <QDebug>
#include <QFile>
#include <QDomDocument>
#include <QDomElement>

QDir woodProfileDir("../assets/woodprofiles/");

bool XMLAccess::readProfilesXML(WoodModel *model)
{
    QFile xmlFile(woodProfileDir.absolutePath() + "/woodprofiles.xml");
    qDebug() <<xmlFile.fileName();
    xmlFile.open(QIODevice::ReadOnly);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML wood profile file";
        return false;
    }
    QDomDocument doc;
    qDebug() << "Parsing content" << doc.setContent(&xmlFile);
    QDomElement element = doc.documentElement();
    for(QDomElement n = element.firstChildElement(); !n.isNull(); n = n.nextSiblingElement()) {
        QImage img(woodProfileDir.absolutePath() + "/" + n.firstChildElement("img").text());
        qDebug() << "Image could not be loaded" << img.isNull() <<
                    woodProfileDir.absolutePath() + "/" + n.firstChildElement("img").text();
        Wood newWoodElement(n.firstChildElement("name").text(), img);
        model->addProfile(newWoodElement);
    }
    return true;
}

bool XMLAccess::saveProfilesXML(WoodModel *model)
{
    QFile xmlFile(woodProfileDir.absolutePath() + "/woodprofiles.xml");
    xmlFile.open(QIODevice::WriteOnly | QIODevice::Truncate);
    if (!xmlFile.isOpen()) {
        qWarning() << "Could not open XML wood profile file for writing";
        return false;
    }

    QDomDocument doc;
    QDomElement root = doc.createElement("woodprofiles");
    for (int i=0; i<model->rowCount(); i++) {
        QDomElement newProfile = doc.createElement("profile");

        QDomElement attribute = doc.createElement("name");
        QDomText text = doc.createTextNode(model->data(model->index(i), WoodModel::NameRole).toString());
        attribute.appendChild(text);
        newProfile.appendChild(attribute);

        QImage img = model->data(model->index(i), WoodModel::ImageRole).value<QImage>();
        QString imgFilename = woodProfileDir.absolutePath() + "/" + QString::number(i) + ".jpg";
        if (!img.save(imgFilename)) {
            qWarning() << "Could not save image file" << imgFilename;
        }

        attribute = doc.createElement("img");
        text = doc.createTextNode(QString::number(i) + ".jpg");
        attribute.appendChild(text);
        newProfile.appendChild(attribute);

        root.appendChild(newProfile);
    }
    doc.appendChild(root);

    if (xmlFile.write(doc.toString().toUtf8()) == -1) {
        qWarning() << "Could not write to xml file";
        return false;
    }

    return true;
}
