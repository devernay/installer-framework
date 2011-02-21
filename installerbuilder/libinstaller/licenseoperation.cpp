/**************************************************************************
**
** This file is part of Qt SDK**
**
** Copyright (c) 2011 Nokia Corporation and/or its subsidiary(-ies).*
**
** Contact:  Nokia Corporation qt-info@nokia.com**
**
** No Commercial Usage
**
** This file contains pre-release code and may not be distributed.
** You may use this file in accordance with the terms and conditions
** contained in the Technology Preview License Agreement accompanying
** this package.
**
** GNU Lesser General Public License Usage
**
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this file.
** Please review the following information to ensure the GNU Lesser General
** Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception version
** 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** If you are unsure which license is appropriate for your use, please contact
** (qt-info@nokia.com).
**
**************************************************************************/
#include "licenseoperation.h"

#include "qinstaller.h"
#include "common/installersettings.h"

#include <QtCore/QDir>
#include <QtCore/QFile>
#include <QtCore/QTextStream>

using namespace QInstaller;

LicenseOperation::LicenseOperation()
{
    setName(QLatin1String("License"));
}

LicenseOperation::~LicenseOperation()
{
}

void LicenseOperation::backup()
{
}

bool LicenseOperation::performOperation()
{
    QVariantMap licenses = value(QLatin1String("licenses")).toMap();
    if (licenses.isEmpty()) {
        setError(UserDefinedError);
        setErrorString(tr("No license files found to copy."));
        return false;
    }

    Installer *installer = qVariantValue<Installer*>(value(QLatin1String("installer")));
    QString targetDir = QString::fromLatin1("%1/%2").arg(installer->value(QLatin1String("TargetDir")),
        QLatin1String("Licenses"));

    QDir dir;
    dir.mkpath(targetDir);
    setArguments(QStringList(targetDir));

    for (QVariantMap::const_iterator it = licenses.begin(); it != licenses.end(); ++it) {
        QFile file(targetDir + QDir::separator() + it.key());
        if (!file.open(QIODevice::WriteOnly | QIODevice::Truncate)) {
            setError(UserDefinedError);
            setErrorString(tr("Can not write license file: %1.").arg(targetDir + QDir::separator()
                + it.key()));
            return false;
        }

        QTextStream stream(&file);
        stream << it.value().toString();
    }

    return true;
}

bool LicenseOperation::undoOperation()
{
    QVariantMap licenses = value(QLatin1String("licenses")).toMap();
    if (licenses.isEmpty()) {
        setError(UserDefinedError);
        setErrorString(tr("No license files found to delete."));
        return false;
    }

    QString targetDir = arguments().value(0);
    for (QVariantMap::const_iterator it = licenses.begin(); it != licenses.end(); ++it)
        QFile::remove(targetDir + QDir::separator() + it.key());

    QDir dir;
    dir.rmdir(targetDir);

    return true;
}

bool LicenseOperation::testOperation()
{
    return true;
}

LicenseOperation* LicenseOperation::clone() const
{
    return new LicenseOperation();
}
