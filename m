Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF26AEE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:45:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58752.1694439950667126975
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 725FDD75;
	Mon, 11 Sep 2023 06:46:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF5643F766;
	Mon, 11 Sep 2023 06:45:49 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm/generic-arm64: set XSERVER to install the modesetting driver
Date: Mon, 11 Sep 2023 14:45:45 +0100
Message-Id: <20230911134545.426509-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911134545.426509-1-ross.burton@arm.com>
References: <20230911134545.426509-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 13:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5031

From: Ross Burton <ross.burton@arm.com>

The default XSERVER only pulls in the framebuffer driver, which is
pretty broken with modern kernels and the modesetting driver is a lot
more functional.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/generic-arm64.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
index 27a0a2f1..2e82e86a 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -19,3 +19,8 @@ MACHINE_FEATURES:append =3D " alsa bluetooth efi qemu-u=
sermode rtc screen usbhost
=20
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
+
+XSERVER ?=3D "xserver-xorg \
+            xf86-video-fbdev \
+            xf86-video-modesetting \
+            "
--=20
2.34.1


