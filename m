Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CF7D74EC3
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 12:55:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66840.1769172947931059766
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 04:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4E961476;
	Fri, 23 Jan 2026 04:55:40 -0800 (PST)
Received: from LD2MDJPLW0.arm.com (unknown [10.57.50.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C65373F632;
	Fri, 23 Jan 2026 04:55:46 -0800 (PST)
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH whinlatter] arm-bsp/docs:corstone1000: Update copyright and host tool versions
Date: Fri, 23 Jan 2026 12:55:40 +0000
Message-ID: <20260123125540.41390-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Jan 2026 12:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6869

Update Corstone-1000 documentation to reflect 2026 copyright and
current supported host environment.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/conf.py    |  6 +++---
 .../documentation/corstone1000/user-guide.rst      | 14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/conf.py b/meta-arm-b=
sp/documentation/corstone1000/conf.py
index 0202e574..7603d14e 100644
--- a/meta-arm-bsp/documentation/corstone1000/conf.py
+++ b/meta-arm-bsp/documentation/corstone1000/conf.py
@@ -1,4 +1,4 @@
-# SPDX-FileCopyrightText: <text>Copyright 2020-2024 Arm Limited and/or i=
ts
+# SPDX-FileCopyrightText: <text>Copyright 2020-2024, 2026 Arm Limited an=
d/or its
 # affiliates <open-source-office@arm.com></text>
 #
 # SPDX-License-Identifier: MIT
@@ -26,8 +26,8 @@ sys.path.append(os.path.dirname(__file__))
=20
 # -- Project information -----------------------------------------------=
------
=20
-project =3D 'corstone1000'
-copyright =3D '2020-2024, Arm Limited'
+project =3D 'Corstone-1000'
+copyright =3D '2020-2026, Arm Limited'
 author =3D 'Arm Limited'
=20
=20
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index ddea8931..5240e2b6 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -18,17 +18,17 @@ for more information.
 Prerequisites
 -------------
=20
-This guide assumes that your host machine is running Ubuntu 20.04 LTS ( =
with ``sudo`` rights), with at least
+This guide assumes that your host machine is running Ubuntu 24.04 LTS ( =
with ``sudo`` rights), with at least
 32GB of free disk space and 16GB of RAM as minimum requirement.
=20
 The following prerequisites must be available on the host system:
=20
-- Git 1.8.3.1 or greater.
-- Python 3.8.0 or greater.
-- GNU Tar 1.28 or greater.
-- GNU Compiler Collection 8.0 or greater.
-- GNU Make 4.0 or greater.
-- tmux.
+- Git 2.39.2 or greater.
+- Python 3.11.2 or greater.
+- GNU Tar 1.34 or greater.
+- GNU Compiler Collection 12.2 or greater.
+- GNU Make 4.3 or greater.
+- tmux 3.3 or greater.
=20
 Please follow the steps described in the Yocto mega manual:
=20

