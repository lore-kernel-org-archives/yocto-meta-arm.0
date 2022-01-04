Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355A1C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 15:36:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8065.1641310560894239208
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 07:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F07B13A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 07:35:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39C443F774
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jan 2022 07:35:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: add missing headers to native-dtc.patch
Date: Tue,  4 Jan 2022 15:35:53 +0000
Message-Id: <20220104153553.2615223-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 15:36:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2780

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../hafnium/hafnium/native-dtc.patch          | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch b/meta=
-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
index 8cdb0601..840c0bc9 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
@@ -1,14 +1,16 @@
+Use our dtc tools instead of the prebuilt (x86-64-only) binaries.
+
+Upstream-Status: Pending [part of a larger effort to remove prebuilt]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 diff --git a/build/image/dtc.py b/build/image/dtc.py
-index d0778186..a5d831be 100755
+index d077818..1513120 100755
 --- a/build/image/dtc.py
 +++ b/build/image/dtc.py
-@@ -18,6 +18,9 @@ DTC_ROOT =3D os.path.join(HF_ROOT, "prebuilts", "linux=
-x64", "dtc")
- DTC =3D os.path.join(DTC_ROOT, "dtc")
- FDTOVERLAY =3D os.path.join(DTC_ROOT, "fdtoverlay")
-=20
-+DTC =3D  "dtc"
+@@ -16,4 +16,2 @@ import sys
+-HF_ROOT =3D os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
+-DTC_ROOT =3D os.path.join(HF_ROOT, "prebuilts", "linux-x64", "dtc")
+-DTC =3D os.path.join(DTC_ROOT, "dtc")
+-FDTOVERLAY =3D os.path.join(DTC_ROOT, "fdtoverlay")
++DTC =3D "dtc"
 +FDTOVERLAY =3D "fdtoverlay"
-+
- def cmd_compile(args):
-     exec_args =3D [
-             DTC,
--=20
2.25.1


