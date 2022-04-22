Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A16CC6369B
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10720.1650643780278850910
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5CB21FB;
	Fri, 22 Apr 2022 09:09:39 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.95.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 097FF3F5A1;
	Fri, 22 Apr 2022 09:09:38 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/6] arm-bsp/boot-wrapper-aarch64,u-boot: Clarify fvp-baser
 Upstream-Status
Date: Fri, 22 Apr 2022 17:08:57 +0100
Message-Id: <20220422160900.1861031-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422160900.1861031-1-peter.hoyes@arm.com>
References: <20220422160900.1861031-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3288

From: Peter Hoyes <Peter.Hoyes@arm.com>

The final firmware design for the fvp-baser-aemv8r64 is pending further
discussion, so the current implementation contains several "temporary"
patches which are likely to be removed or replaced in the future. These
are already marked as "Inappropriate" to upstream, but amend the reason
to "Implementation pending further discussion" to avoid confusion.

Issue-Id: SCM-4304
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I7dc6eae73fbb18f4b7b63540fb45b6a62d455093
---
 .../0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch       | 2 +-
 .../files/fvp-baser-aemv8r64/0009-lds-Mark-the-mem-range.patch  | 2 +-
 .../fvp-baser-aemv8r64/0010-common-Introduce-the-libfdt.patch   | 2 +-
 .../0011-common-Add-essential-libc-functions.patch              | 2 +-
 .../0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch   | 2 +-
 .../fvp-baser-aemv8r64/0013-platform-Add-print_hex-func.patch   | 2 +-
 .../0014-common-Add-mem-usage-to-memreserve.patch               | 2 +-
 .../0015-boot-Add-the-enable-keep-el-compile-option.patch       | 2 +-
 .../0006-armv8-Add-ARMv8-MPU-configuration-logic.patch          | 2 +-
 ...7-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch | 2 +-
 .../0008-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch           | 2 +-
 ...9-armv8-Make-disabling-HVC-configurable-when-switching.patch | 2 +-
 .../0010-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch          | 2 +-
 .../0011-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch b/meta-a=
rm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0008-aar=
ch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
index a14e54a..2ce28b7 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
@@ -16,7 +16,7 @@ FEAT_VHE. We can simply set CNTHCTL_EL2.EL1PCTEN to 1.
=20
 Issue-ID: SCM-3508
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: I4147e66341c8153312021e6f2ab67d0037246da1
 ---
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0009-lds-Mark-the-mem-range.patch b/meta-arm-bsp/recipes-bsp/b=
oot-wrapper-aarch64/files/fvp-baser-aemv8r64/0009-lds-Mark-the-mem-range.=
patch
index 3d4fec8..0c310eb 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0009-lds-Mark-the-mem-range.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0009-lds-Mark-the-mem-range.patch
@@ -9,7 +9,7 @@ calculate the mem range of boot-wrapper and then set the =
range to
=20
 Issue-ID: SCM-3815
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: Idc5a2894e193c75381049a0f359b4b2a51c567ee
 ---
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0010-common-Introduce-the-libfdt.patch b/meta-arm-bsp/recipes-=
bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0010-common-Introduce-t=
he-libfdt.patch
index e0496dc..0305f8b 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0010-common-Introduce-the-libfdt.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0010-common-Introduce-the-libfdt.patch
@@ -15,7 +15,7 @@ We choose BSD because the boot-wrapper is under BSD.
=20
 Issue-Id: SCM-3814
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: Iec2f469053c8ac0ed38838c597b21a42bdf67b38
 ---
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0011-common-Add-essential-libc-functions.patch b/meta-arm-bsp/=
recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0011-common-Add=
-essential-libc-functions.patch
index aa05a72..871a178 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0011-common-Add-essential-libc-functions.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0011-common-Add-essential-libc-functions.patch
@@ -13,7 +13,7 @@ terms of BSD license. It is the same with boot-wrapper.
=20
 Issue-Id: SCM-3814
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: If3b55b00afa8694c7522df989a41e0b38eda1d38
 ---
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch b/me=
ta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0012=
-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
index eeddaac..5917ef2 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
@@ -9,7 +9,7 @@ compile. Add -fno-stack-protector to fix it.
=20
 Issue-Id: SCM-3814
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: I472bc28cdc5cde3b22461a4b7d7a3752ae382b4b
 ---
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0013-platform-Add-print_hex-func.patch b/meta-arm-bsp/recipes-=
bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0013-platform-Add-print=
_hex-func.patch
index 7d643ff..136e18e 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0013-platform-Add-print_hex-func.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0013-platform-Add-print_hex-func.patch
@@ -8,7 +8,7 @@ numbers.
=20
 Issue-Id: SCM-3814
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: Ic960345d9ef0b41d81d30c4a4dbd9c31139907c4
 ---
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0014-common-Add-mem-usage-to-memreserve.patch b/meta-arm-bsp/r=
ecipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0014-common-Add-=
mem-usage-to-memreserve.patch
index f5263d2..ea51816 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0014-common-Add-mem-usage-to-memreserve.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0014-common-Add-mem-usage-to-memreserve.patch
@@ -8,7 +8,7 @@ services with libfdt.
=20
 Issue-Id: SCM-3815
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: I2ea80cdf736a910fa2c3deb622e21d50f04be960
 ---
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0015-boot-Add-the-enable-keep-el-compile-option.patch b/meta-a=
rm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0015-boo=
t-Add-the-enable-keep-el-compile-option.patch
index 6c708e9..0411ef0 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0015-boot-Add-the-enable-keep-el-compile-option.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0015-boot-Add-the-enable-keep-el-compile-option.patch
@@ -12,7 +12,7 @@ Linux PSCI, this option will cause secondary cores boot=
ing at EL1.
=20
 Issue-Id: SCM-3813
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Jaxson Han <jaxson.han@arm.com>
 Change-Id: I3ba9c87cf0b59d163ca433f74c9e3a46e5ca2c63
 ---
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
06-armv8-Add-ARMv8-MPU-configuration-logic.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0006-armv8-Add-ARMv8-MPU-configuratio=
n-logic.patch
index 6e708e1..08cfa26 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
@@ -16,7 +16,7 @@ board configurations.
=20
 Issue-Id: SCM-2443
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I0ee3879f9d7f03fe940664b3551c68eeaa458d17
 ---
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
07-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-armv8-Allow-disabli=
ng-exception-vectors-on-non-SPL-b.patch
index 1000123..4c567dc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
@@ -16,7 +16,7 @@ that both config flags be be targeted using CONFIG_IS_E=
NABLED.
=20
 Issue-Id: SCM-3728
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I0cf0fc6d7ef4d45791411cf1f67c65e198cc8b2b
 ---
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
08-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv8-ARMV8_SWITCH_TO_EL1-improve=
ments.patch
index 046636b..8cbd1f8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
@@ -13,7 +13,7 @@ option.
=20
 Issue-Id: SCM-3728
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: If98478148d6d8d1f732acac5439276700614815f
 ---
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
09-armv8-Make-disabling-HVC-configurable-when-switching.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv8-Make-disablin=
g-HVC-configurable-when-switching.patch
index b12e018..f1d35d5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
@@ -12,7 +12,7 @@ control whether to disable HVC exceptions in HCR_EL2->H=
CD
=20
 Issue-Id: SCM-3728
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I463d82f1db8a3cafcab40a9c0c208753569cc300
 ---
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
10-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0010-vexpress64-Do-not-set-COUNTER_FR=
EQUENCY.patch
index 2912070..e63b28d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0010-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0010-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
@@ -11,7 +11,7 @@ providing PSCI services).
=20
 Issue-Id: SCM-3728
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I137473d721e58e4c348b9641f5b9778178d3bb65
 ---
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
11-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0011-vexpress64-Add-BASER_FVP=
-vexpress-board-variant.patch
index 36e820c..8a99063 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0011-vexp=
ress64-Add-BASER_FVP-vexpress-board-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0011-vexp=
ress64-Add-BASER_FVP-vexpress-board-variant.patch
@@ -19,7 +19,7 @@ inverted from the BASE_FVP
=20
 Issue-Id: SCM-3728
 Upstream-Status: Inappropriate [other]
-  Temporary patch
+  Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: Id173e52afad473abcf3f61c6bf374fc31f17edd3
 ---
--=20
2.25.1


