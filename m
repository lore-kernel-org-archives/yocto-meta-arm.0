Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8451FD3C930
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.244.1765384415138847347
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Dec 2025 08:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CD1F175D
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 08:33:27 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30EB53F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 08:33:34 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-a: update git recipe to v2.14-rc1
Date: Wed, 10 Dec 2025 11:33:31 -0500
Message-ID: <20251210163332.66571-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210163332.66571-1-jon.mason@arm.com>
References: <20251210163332.66571-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 16:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6793

Update the TF-A git recipe to the latest tag.  The license SHA needed to
be updated due to adding of some memmap sources from mbed, which are
under the Apache 2.0 license, which is already present in the inc file.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_git.bb            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 811fab8439de..f5f15c90900d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -1,10 +1,10 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A master
-SRCREV_tfa =3D "c17351450c8a513ca3f30f936e26a71db693a145"
+# TF-A master, tag: v2.14-rc1
+SRCREV_tfa =3D "96147cc84b7dd8b4f53c9fed553b0c61af060898"
 SRCBRANCH =3D "master"
=20
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118e32884721c0be33=
267bd7ae11130"
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
--=20
2.50.1 (Apple Git-155)


