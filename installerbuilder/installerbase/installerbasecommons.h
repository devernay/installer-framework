/**************************************************************************
**
** This file is part of Qt SDK**
**
** Copyright (c) 2010 Nokia Corporation and/or its subsidiary(-ies).*
**
** Contact:  Nokia Corporation qt-info@nokia.com**
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
#ifndef INSTALLERBASECOMMONS_H
#define INSTALLERBASECOMMONS_H

#include <QObject>
#include <qinstallergui.h>



class QFileInfo;
class QLabel;
class QString;
//class

namespace QInstaller{
    class Installer;
}

using namespace QInstaller;
//using namespace QInstallerCreator;

// A custom target directory selection based due to the no-space
// restriction...

class TargetDirectoryPageImpl : public QInstaller::TargetDirectoryPage
{
    Q_OBJECT
public:
    explicit TargetDirectoryPageImpl(QInstaller::Installer *installer);

    QString targetDirWarning() const;

    bool isComplete() const;

    bool askQuestion( const QString& identifier, const QString& message );

    bool failWithWarning( const QString& identifier, const QString& message );

    bool validatePage();

private:
    QLabel *m_warningLabel;
};

////////////////////////////////////////////////////////////////////
//
// QtInstallerGui
//
////////////////////////////////////////////////////////////////////

class QtInstallerGui : public QInstaller::Gui
{
    Q_OBJECT

public:
    explicit QtInstallerGui(QInstaller::Installer *installer);

    virtual void init();
};


////////////////////////////////////////////////////////////////////
//
// QtUninstallerGui
//
////////////////////////////////////////////////////////////////////

class QtUninstallerGui : public QInstaller::Gui
{
    Q_OBJECT

public:
    explicit QtUninstallerGui(QInstaller::Installer *installer);

    virtual void init();
    virtual int nextId() const;
};

class GetMetaInfoProgressWidget : public QWidget
{
    Q_OBJECT

public:
    explicit GetMetaInfoProgressWidget( QWidget* parent = 0 );
    QString text() const;

public Q_SLOTS:
    void message(KDJob*, const QString & msg);

private:
    QLabel *m_label;
};


const int INST_SUCCESS = 0;
const int INST_FAILED = 1;
const int INST_CANCELED = 2;

#endif // INSTALLERBASECOMMONS_H
