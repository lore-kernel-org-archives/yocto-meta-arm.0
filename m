Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.43173.1628891463310909336
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 14:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D236040C3A;
	Fri, 13 Aug 2021 21:51:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AThWpWiyqGAG; Fri, 13 Aug 2021 21:51:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C735540A47;
	Fri, 13 Aug 2021 21:50:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9E24317465C;
	Fri, 13 Aug 2021 17:50:57 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2] arm-toolchain: grub: fix do_configure() breakage with external-arm toolchain
Date: Fri, 13 Aug 2021 17:50:57 -0400
Message-Id: <1628891457-7585-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

grub and grub-efi break in do_configure() when using external-arm toolchain:

| checking for aarch64-poky-linux-objcopy... no
| checking for objcopy... objcopy
| checking for aarch64-poky-linux-strip... no
| checking for strip... strip
| checking for aarch64-poky-linux-nm... no
| checking for nm... nm
| checking for aarch64-poky-linux-ranlib... no
| checking for ranlib... ranlib
...
| checking whether objcopy works for absolute addresses... configure: error: objcopy cannot create binary files

That is due to external-arm toolchain's target triplet aarch64-none-linux-gnu
being different from OE triplet like aarch64-poky-linux and configure script
trying to use it to find binutils binaries like objcopy, falling back to host
ones.

Help configure script to find correct objcopy and other binaries by passing
the correct target triplet with --target parameter set to EAT_TARGET_SYS,
overriding the default OE one.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Tom Rini <trini@konsulko.com>
---
v2 - rework to not break yocto-check-layer signature test

 meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend        | 1 +
 meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
 create mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc

diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend b/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
new file mode 100644
index 0000000..37383d4
--- /dev/null
+++ b/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
@@ -0,0 +1 @@
+require ${@oe.utils.conditional('TCMODE', 'external-arm', 'grub-external-arm.inc', '', d)}
diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc b/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc
new file mode 100644
index 0000000..dc260be
--- /dev/null
+++ b/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc
@@ -0,0 +1,5 @@
+# grub uses --target triplet to find binutils binaries such as objcopy
+# Since external-arm toolchain uses aarch64-none-linux-gnu triplet,
+# OE-defined TARGET_SYS differs from EAT_TARGET_SYS used by external-arm
+# toolchain, grub needs passing the correct --target to configure script
+CONFIGUREOPTS:append:class-target = " --target=${EAT_TARGET_SYS}"
-- 
2.7.4

