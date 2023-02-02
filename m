Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B4FC05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:42:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11030.1675330930402210476
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12E98C14;
	Thu,  2 Feb 2023 01:42:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 746563F882;
	Thu,  2 Feb 2023 01:42:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/corstone*00: disable openssl in kmod
Date: Thu,  2 Feb 2023 09:42:04 +0000
Message-Id: <20230202094204.3111621-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:42:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4346

The initramfs needs to be very small, but since oe-core d6a62e kmod has
enabled OpenSSL support which doubles the size of the initramfs,
resulting in boot failures.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf         | 3 +++
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index dfc850db..12634a3b 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -43,3 +43,6 @@ FVP_DATA ?=3D "css.cluster.cpu0=3D${DEPLOY_DIR_IMAGE}/$=
{IMAGE_NAME}.rootfs.wic.nopt@
 FVP_CONSOLE ?=3D "terminal_0"
 FVP_TERMINALS[css.terminal_0] ?=3D "console"
 FVP_TERMINALS[css.terminal_1] ?=3D ""
+
+# Disable openssl in kmod to shink the initramfs size
+PACKAGECONFIG:remove:pn-kmod =3D "openssl"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index d5d6418d..2869d78c 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -73,3 +73,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 WKS_FILE ?=3D "corstone1000-image.corstone1000.wks"
+
+# Disable openssl in kmod to shink the initramfs size
+PACKAGECONFIG:remove:pn-kmod =3D "openssl"
--=20
2.34.1


