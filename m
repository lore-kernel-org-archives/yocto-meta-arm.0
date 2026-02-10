Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C81EA8123
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:41:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21083.1770734486097050433
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 06:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C01C339
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Feb 2026 06:41:18 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D85913F632
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Feb 2026 06:41:24 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: add MMC and 9P to kernel config
Date: Tue, 10 Feb 2026 09:41:23 -0500
Message-ID: <20260210144123.64352-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Feb 2026 14:41:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6895

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/fvp.scc         | 2 ++
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-mmc.cfg | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp/fvp-mmc.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kme=
ta/bsp/arm-platforms/fvp.scc
index 8e9731d4f9e1..6fd33296e006 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp.scc
@@ -2,6 +2,7 @@ include features/input/input.scc
 include features/net/net.scc
 include cfg/timer/no_hz.scc
 include cfg/virtio.scc
+include virtio-9p.scc
=20
 kconf hardware fvp/fvp-board.cfg
 kconf hardware fvp/fvp-net.cfg
@@ -10,3 +11,4 @@ kconf hardware fvp/fvp-serial.cfg
 kconf hardware fvp/fvp-cfi.cfg
 kconf hardware fvp/fvp-drm.cfg
 kconf hardware fvp/fvp-watchdog.cfg
+kconf hardware fvp/fvp-mmc.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp/fvp-mmc.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platf=
orms-kmeta/bsp/arm-platforms/fvp/fvp-mmc.cfg
new file mode 100644
index 000000000000..41af527c8aaa
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp/fvp-mmc.cfg
@@ -0,0 +1,2 @@
+CONFIG_MMC=3Dy
+CONFIG_MMC_ARMMMCI=3Dy
--=20
2.50.1 (Apple Git-155)


