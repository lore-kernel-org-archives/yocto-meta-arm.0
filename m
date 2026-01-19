Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86690CCF2F5
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:47:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33684.1768823246032074665
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Jan 2026 03:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C984A1517;
	Mon, 19 Jan 2026 03:47:18 -0800 (PST)
Received: from LXKV206JHX.emea.arm.com (LXKV206JHX.cambridge.arm.com [10.1.33.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56693F740;
	Mon, 19 Jan 2026 03:47:24 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH whinlatter v2 2/2] arm-bsp/docs:corstone1000: Update copyright notice
Date: Mon, 19 Jan 2026 11:47:19 +0000
Message-ID: <20260119114719.65080-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260119114719.65080-1-hugues.kambampiana@arm.com>
References: <20260119114719.65080-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Jan 2026 11:47:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6858

Update the copyright notice year.
---
 meta-arm-bsp/documentation/corstone1000/change-log.rst      | 2 +-
 meta-arm-bsp/documentation/corstone1000/index.rst           | 2 +-
 meta-arm-bsp/documentation/corstone1000/release-notes.rst   | 2 +-
 .../documentation/corstone1000/software-architecture.rst    | 4 ++--
 meta-arm-bsp/documentation/corstone1000/user-guide.rst      | 6 +++---
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index 52c860b2..e42c5a41 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -568,4 +568,4 @@ Changes
=20
 --------------
=20
-*Copyright (c) 2022-2024, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2026, Arm Limited. All rights reserved.*
diff --git a/meta-arm-bsp/documentation/corstone1000/index.rst b/meta-arm=
-bsp/documentation/corstone1000/index.rst
index cbe78c5d..e9d77f62 100644
--- a/meta-arm-bsp/documentation/corstone1000/index.rst
+++ b/meta-arm-bsp/documentation/corstone1000/index.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022, 2024, Arm Limited.
+ # Copyright (c) 2022, 2024, 2026 Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/=
meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 6ddc138f..1a7e312a 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -280,4 +280,4 @@ For all security issues, contact Arm by email at psir=
t@arm.com.
=20
 --------------
=20
-*Copyright (c) 2022-2023, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2026, Arm Limited. All rights reserved.*
diff --git a/meta-arm-bsp/documentation/corstone1000/software-architectur=
e.rst b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
index e4f407d8..25ac8f93 100644
--- a/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
+++ b/meta-arm-bsp/documentation/corstone1000/software-architecture.rst
@@ -1,5 +1,5 @@
 ..
- # Copyright (c) 2022-2025, Arm Limited.
+ # Copyright (c) 2022-2026, Arm Limited.
  #
  # SPDX-License-Identifier: MIT
=20
@@ -468,7 +468,7 @@ References
=20
 --------------
=20
-*Copyright (c) 2022-2025, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2026, Arm Limited. All rights reserved.*
=20
 .. _arm-developer-cs1000-website: https://developer.arm.com/Tools%20and%=
20Software/Corstone-1000%20Software
 .. _arm-developer-cs1000-search: https://developer.arm.com/search#q=3Dco=
rstone-1000
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 230baa2c..ddea8931 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -50,7 +50,7 @@ The Corstone-1000 software stack can be run on:
 Yocto Stable Branch
 -------------------
=20
-Corstone-1000 software stack is built on top of Yocto Project's `Walnasc=
ar release <meta-arm-repository-release-branch_>`__.
+Corstone-1000 software stack is built on top of Yocto Project's `Whinlat=
ter release <meta-arm-repository-release-branch_>`__.
=20
 Software Components
 -------------------
@@ -2365,12 +2365,12 @@ and `Arm Development Studio <arm-ds-website_>`__ =
versions 2022.2, 2022.c, or 202
=20
 --------------
=20
-*Copyright (c) 2022-2025, Arm Limited. All rights reserved.*
+*Copyright (c) 2022-2026, Arm Limited. All rights reserved.*
=20
 .. _arm-developer-fvp: https://developer.arm.com/tools-and-software/open=
-source-software/arm-platforms-software/arm-ecosystem-fvps
 .. _secure-debug-manager-repo-readme: https://github.com/ARM-software/se=
cure-debug-manager/tree/master?tab=3Dreadme-ov-file#secure-debug-manager-=
psa-adac--sdc-600
 .. _secure-debug-manager-armds-integration: https://github.com/ARM-softw=
are/secure-debug-manager?tab=3Dreadme-ov-file#arm-development-studio-inte=
gration
-.. _meta-arm-repository-release-branch: https://web.git.yoctoproject.org=
/meta-arm?h=3Dwalnascar
+.. _meta-arm-repository-release-branch: https://docs.yoctoproject.org/ne=
xt/migration-guides/migration-5.3.html
 .. _arm-ulink-pro-website: https://www.arm.com/products/development-tool=
s/debug-probes/ulink-pro
 .. _arm-ds-website: https://www.arm.com/products/development-tools/embed=
ded-and-software/arm-development-studio
 .. _edk2-repository: https://github.com/tianocore/edk2

