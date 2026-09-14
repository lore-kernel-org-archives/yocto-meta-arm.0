Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C273BC88E73
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 21:49:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9309.1789422579307158661
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 14:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=rM3EzKX6;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30EFF1570
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Sep 2026 14:49:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C1613F882
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Sep 2026 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789422578; bh=l1b9FWX6JeV2CHldrONkAzS8S1zIufkXhBt75Gk3uTU=;
	h=From:To:Subject:Date:From;
	b=rM3EzKX6ZG84hdwtF9q44HKAPmsXJF7s1FsCY0BJzu0XehaA0jCXvEF+nTCyfeRur
	 W0AjTokLxXOxQ9GdDeWjSLqK+eFRuDeAkJR6NC0VNjFnhNgBMfD2pAB9int0BiAsE2
	 KI7E/I7QJH93J0Uag/zPstwFSMFdAxXHsz0i4kNM=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/sbsa-ref: add e1000e to kernel config
Date: Mon, 14 Sep 2026 17:49:37 -0400
Message-ID: <20260914214937.18745-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Sep 2026 21:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7165

Recent changes to the arm64 kernel defconfig changed CONFIG_E1000E from
built-in to a module. This breaks testimage networking on the SBSA
Reference platform.

testimage provides the target network configuration through the kernel
=E2=80=9Cip=3D=E2=80=9D command-line option. The kernel needs the network=
 driver to be
built-in in order to configure the interface from this option during
boot. With e1000e built as a module, the interface is not available at
that point and testimage is unable to establish an SSH connection to the
target.

Set CONFIG_E1000E=3Dy in the sbsa-ref kernel configuration to make the
driver built-in again and restore testimage SSH testing.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/files/sbsa-ref/e1000.cfg | 1 +
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc  | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/sbsa-ref/e100=
0.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/sbsa-ref/e1000.cfg b=
/meta-arm-bsp/recipes-kernel/linux/files/sbsa-ref/e1000.cfg
new file mode 100644
index 000000000000..cc3fe0047ee7
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/sbsa-ref/e1000.cfg
@@ -0,0 +1 @@
+CONFIG_E1000E=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 537259589688..31b6df05407f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -135,3 +135,6 @@ KBUILD_DEFCONFIG:sbsa-ref =3D "defconfig"
 KCONFIG_MODE:sbsa-ref =3D "--alldefconfig"
 # Upstream defconfig often causes warnings but we don't maintain it
 KCONF_BSP_AUDIT_LEVEL:sbsa-ref =3D "0"
+# Build e1000e into the kernel for testimage
+FILESEXTRAPATHS:prepend:sbsa-ref :=3D "${ARMBSPFILESPATHS}"
+SRC_URI:append:sbsa-ref =3D " file://e1000.cfg"
--=20
2.50.1 (Apple Git-155)


