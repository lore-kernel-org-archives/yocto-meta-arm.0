Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E109DC7EE2F
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 20:06:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.470.1685045168476161791
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 May 2023 13:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417CF1655
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:53 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0612A3F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 13:06:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/linux-yocto: remove 5.15 bbappend
Date: Thu, 25 May 2023 15:06:01 -0500
Message-Id: <20230525200602.3277592-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525200602.3277592-1-jon.mason@arm.com>
References: <20230525200602.3277592-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 20:06:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4708

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbapp=
end

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend b/m=
eta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend
deleted file mode 100644
index 9a18dd8a..00000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.15%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.15:"
-
-SRC_URI:append:qemuarm64-secureboot =3D " \
-    file://skip-unavailable-memory.patch \
-    "
-
-FFA_TEE_INCLUDE =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa',=
 'arm-ffa-5.15.inc', '' , d)}"
-require ${FFA_TEE_INCLUDE}
--=20
2.30.2


