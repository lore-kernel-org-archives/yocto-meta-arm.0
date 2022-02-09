Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E202C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30023.1644428782483310034
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9553ED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83A8E3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/linux-yocto: remove redundant kernel hacking
Date: Wed,  9 Feb 2022 17:46:10 +0000
Message-Id: <20220209174610.3824795-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209174610.3824795-1-ross.burton@arm.com>
References: <20220209174610.3824795-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2968

The CS1K kernel used overrides to empty the kernel-image package, so
the initramfs didn't contain a kernel image.

The initramfs contained a kernel via a bad dependency in ffa-debugfs-mod,
but now that has been worked around we can remove the CS1K workaround.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/linux-arm-platforms.inc              | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 0f62011c..a8d12841 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -91,24 +91,6 @@ SRC_URI:append:corstone1000 =3D " ${@bb.utils.contains=
('MACHINE_FEATURES', \
 # corstone1000 has limited flash memory constraints
 KERNEL_EXTRA_FEATURES:corstone1000 =3D ""
 KERNEL_FEATURES:corstone1000 =3D ""
-# No need to include the kernel image in the rootfs
-# So, let's delete the package doing that and uninstalling the initial
-# kernel binary.
-# The kernel binary needed is the initramfs bundle
-
-FILES:kernel-image-image:corstone1000=3D""
-
-# Uninstalling the initial kernel binary
-
-do_install:append:corstone1000() {
-    if [ -e "${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}" ]; t=
hen
-        rm ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
-    fi
-
-    if [ -e "${D}/${KERNEL_IMAGEDEST}/$imageType" ]; then
-        rm ${D}/${KERNEL_IMAGEDEST}/$imageType
-    fi
-}
=20
 #
 # FVP BASE KMACHINE
--=20
2.25.1


