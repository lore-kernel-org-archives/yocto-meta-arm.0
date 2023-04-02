Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380E4C77B60
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 19:33:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52468.1680463979705318753
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 02 Apr 2023 12:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85BEF1042
	for <meta-arm@lists.yoctoproject.org>; Sun,  2 Apr 2023 12:33:43 -0700 (PDT)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F394E3F840
	for <meta-arm@lists.yoctoproject.org>; Sun,  2 Apr 2023 12:32:58 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 2/2] arm/linux-yocto: remove IP_VS config fragment
Date: Sun,  2 Apr 2023 09:16:59 -0400
Message-Id: <20230402131659.560595-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230402131659.560595-1-jon.mason@arm.com>
References: <20230402131659.560595-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 02 Apr 2023 19:33:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4530

This config fragment was needed to get the dev kernel working.  Since it
in now allowed to fail, it is no longer necessary (and doesn't appear to
be an issue).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/files/no-ipvs.cfg     | 1 -
 meta-arm/recipes-kernel/linux/linux-yocto%.bbappend | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/files/no-ipvs.cfg

diff --git a/meta-arm/recipes-kernel/linux/files/no-ipvs.cfg b/meta-arm/r=
ecipes-kernel/linux/files/no-ipvs.cfg
deleted file mode 100644
index fcfd2b21..00000000
--- a/meta-arm/recipes-kernel/linux/files/no-ipvs.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_IP_VS=3Dn
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index cab7f47e..883ed2ca 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -10,7 +10,6 @@ COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
     file://generic-arm64-kmeta;type=3Dkmeta;destsuffix=3Dgeneric-arm64-k=
meta \
-    file://no-ipvs.cfg \
     "
=20
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
--=20
2.25.1


