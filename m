Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9B2C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:41:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.38168.1634571661072069406
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F886101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B2A63F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 08:41:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm-bsp/fvp: enable virtio drivers
Date: Mon, 18 Oct 2021 16:40:53 +0100
Message-Id: <20211018154056.1552230-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018154056.1552230-1-ross.burton@arm.com>
References: <20211018154056.1552230-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Oct 2021 15:41:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2276

All FVPs can use virtio networking devices, so enable virtio in all of
the FVP kernels.

Remove our fvp/fvp-virtio.cfg as there's cfg/virtio.scc we can use.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc | 3 +--
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/fvp.scc       | 3 +--
 .../arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-virtio.cfg  | 4 ----
 3 files changed, 2 insertions(+), 8 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp/fvp-virtio.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platfor=
ms-kmeta/bsp/arm-platforms/fvp-arm32.scc
index 85659aa7..15bb4831 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32.scc
@@ -1,14 +1,13 @@
 include features/input/input.scc
 include cfg/timer/no_hz.scc
+include cfg/virtio.scc
=20
 kconf hardware fvp-arm32/fvp-board.cfg
 kconf hardware fvp-arm32/fvp-features.cfg
 kconf hardware fvp/fvp-net.cfg
 kconf hardware fvp/fvp-rtc.cfg
 kconf hardware fvp/fvp-serial.cfg
-kconf hardware fvp/fvp-virtio.cfg
 kconf hardware fvp/fvp-cfi.cfg
 kconf hardware fvp/fvp-drm.cfg
 kconf hardware fvp/fvp-timer.cfg
-kconf hardware fvp/fvp-virtio.cfg
 kconf hardware fvp/fvp-watchdog.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kme=
ta/bsp/arm-platforms/fvp.scc
index 79e3a69a..80b85819 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp.scc
@@ -1,14 +1,13 @@
 include features/input/input.scc
 include features/net/net.scc
 include cfg/timer/no_hz.scc
+include cfg/virtio.scc
=20
 kconf hardware fvp/fvp-board.cfg
 kconf hardware fvp/fvp-net.cfg
 kconf hardware fvp/fvp-rtc.cfg
 kconf hardware fvp/fvp-serial.cfg
-kconf hardware fvp/fvp-virtio.cfg
 kconf hardware fvp/fvp-cfi.cfg
 kconf hardware fvp/fvp-drm.cfg
 kconf hardware fvp/fvp-timer.cfg
-kconf hardware fvp/fvp-virtio.cfg
 kconf hardware fvp/fvp-watchdog.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp/fvp-virtio.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pl=
atforms-kmeta/bsp/arm-platforms/fvp/fvp-virtio.cfg
deleted file mode 100644
index afc76a09..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp/fvp-virtio.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_VIRTIO=3Dy
-CONFIG_VIRTIO_MMIO=3Dy
-CONFIG_BLOCK=3Dy
-CONFIG_VIRTIO_BLK=3Dy
--=20
2.25.1


