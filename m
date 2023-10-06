Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D62E81DF9
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 13:21:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12594.1696598483232931537
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Oct 2023 06:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4497C15
	for <meta-arm@lists.yoctoproject.org>; Fri,  6 Oct 2023 06:22:01 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A07283F641
	for <meta-arm@lists.yoctoproject.org>; Fri,  6 Oct 2023 06:21:22 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: add recipe for 2023.07.02
Date: Thu,  5 Oct 2023 23:03:41 -0500
Message-Id: <20231006040341.3856573-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Oct 2023 13:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5103

Multiple machines in meta-arm-bsp have need of the 2023.07.02 version of
u-boot.  Temporarily add it here to give those machines enough time to
update to the latest version.

NOTE: MTD changes in u-boot require changes to the qemuarm config.
Specifically, not disabling it.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb | 5 +++++
 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg       | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb b/meta-=
arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb
new file mode 100644
index 00000000..d23176ab
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2023.07.02.bb
@@ -0,0 +1,5 @@
+require recipes-bsp/u-boot/u-boot-common.inc
+require recipes-bsp/u-boot/u-boot.inc
+
+SRCREV =3D "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
+SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Du-boot-2023.07.y"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg b/meta-arm/re=
cipes-bsp/u-boot/u-boot/qemuarm.cfg
index 82c25e27..da414108 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
@@ -2,6 +2,4 @@
 CONFIG_TEXT_BASE=3D0x60000000
 CONFIG_ENV_IS_NOWHERE=3Dy
 # CONFIG_ENV_IS_IN_FLASH is not set
-# CONFIG_MTD is not set
-# CONFIG_MTD_NOR_FLASH is not set
 # CONFIG_CMD_QFW is not set
--=20
2.30.2


