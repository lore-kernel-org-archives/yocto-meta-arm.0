Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D981CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 12:48:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16467.1758890875553194164
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 05:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA3912B
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Sep 2025 05:47:46 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C825F3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Sep 2025 05:47:54 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/juno: remove BT_LEDS config warning
Date: Fri, 26 Sep 2025 08:47:53 -0400
Message-ID: <20250926124753.64145-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Sep 2025 12:48:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6717

Kernel builds are logging the following issue:
WARNING: linux-yocto-6.16.8+git-r0 do_kernel_configcheck: [kernel config]=
: specified values did not make it into the kernel's final configuration:
    [NOTE]: 'CONFIG_BT_LEDS' last val (y) and .config val (n) do not matc=
h

This could be enabled by setting:
CONFIG_LEDS_CLASS=3Dy
CONFIG_NEW_LEDS=3Dy
CONFIG_SND_SOC_HDA=3Dy

But this isn't really useful on the juno platform.  So, better to
disable the BT LEDs.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../arm-platforms-kmeta/bsp/arm-platforms/juno/juno-net.cfg     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-net.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/juno/juno-net.cfg
index 20cc408f3966..5b78c3839cad 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-net.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-net.cfg
@@ -1,3 +1,5 @@
 CONFIG_NET_VENDOR_SMSC=3Dy
 CONFIG_SMSC911X=3Dy
 CONFIG_SMC91X=3Dy
+
+# CONFIG_BT_LEDS is not set
--=20
2.50.1 (Apple Git-155)


