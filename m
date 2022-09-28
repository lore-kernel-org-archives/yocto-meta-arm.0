Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7EBC54EE9
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 14:50:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8755.1664376644896090935
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 07:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEF423A;
	Wed, 28 Sep 2022 07:50:50 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF6FE3F73D;
	Wed, 28 Sep 2022 07:50:42 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH 1/7] arm-bsp/tc: remove hafnium clang patch
Date: Wed, 28 Sep 2022 20:20:30 +0530
Message-Id: <20220928145036.47650-1-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 14:50:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3859

From: Jon Mason <jon.mason@arm.com>

The newly added clang patch does not apply cleanly to the tc version of
hafnium.  Since there are no plans to use clang on tc, remove it for
this platform.

Also, use devtool to clean-up the clang patch in question.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/hafnium/hafnium-tc.inc        |  2 ++
 .../0001-Fix-build-with-clang-15.patch        | 32 ++++++++++++++-----
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
index 4545c829..75707e1d 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -9,6 +9,8 @@ PV =3D "2.7+git${SRCPV}"
=20
 FILESEXTRAPATHS:prepend:tc :=3D "${THISDIR}/files/tc:"
=20
+SRC_URI:remove =3D "file://0001-Fix-build-with-clang-15.patch"
+
 SRC_URI:append =3D " \
         file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth=
.patch \
         file://0002-feat-emulate-interrupt-controller-register-access.pa=
tch \
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-cla=
ng-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-cl=
ang-15.patch
index c376a9c6..f037d2b5 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.p=
atch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.p=
atch
@@ -1,4 +1,4 @@
-From 1a84b72df8e749665733c3489f605264ccc63d73 Mon Sep 17 00:00:00 2001
+From d96f696244e0869654004f49586b53811037db30 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 22 Sep 2022 19:13:49 -0700
 Subject: [PATCH] Fix build with clang-15
@@ -8,15 +8,19 @@ Remove unused variable suites_in_image
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- test/hftest/common.c                                    | 2 --
- test/vmapi/arch/aarch64/gicv3/gicv3.c                   | 2 +-
- test/vmapi/arch/aarch64/gicv3/inc/gicv3.h               | 2 +-
- test/vmapi/arch/aarch64/gicv3/timer_secondary.c         | 2 +-
- test/vmapi/el0_partitions/services/interruptible.c      | 2 +-
- test/vmapi/el0_partitions/services/interruptible_echo.c | 2 +-
- 6 files changed, 5 insertions(+), 7 deletions(-)
+ test/hftest/common.c                                         | 2 --
+ test/vmapi/arch/aarch64/gicv3/gicv3.c                        | 2 +-
+ test/vmapi/arch/aarch64/gicv3/inc/gicv3.h                    | 2 +-
+ test/vmapi/arch/aarch64/gicv3/timer_secondary.c              | 2 +-
+ test/vmapi/el0_partitions/services/interruptible.c           | 2 +-
+ test/vmapi/el0_partitions/services/interruptible_echo.c      | 2 +-
+ test/vmapi/primary_with_secondaries/services/interruptible.c | 2 +-
+ 7 files changed, 6 insertions(+), 8 deletions(-)
=20
+diff --git a/test/hftest/common.c b/test/hftest/common.c
+index 344ff24..175230a 100644
 --- a/test/hftest/common.c
 +++ b/test/hftest/common.c
 @@ -67,7 +67,6 @@ void hftest_json(void)
@@ -35,6 +39,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			suite =3D test->suite;
  			tests_in_suite =3D 0;
  			HFTEST_LOG("    {");
+diff --git a/test/vmapi/arch/aarch64/gicv3/gicv3.c b/test/vmapi/arch/aar=
ch64/gicv3/gicv3.c
+index 682bc4e..82582f0 100644
 --- a/test/vmapi/arch/aarch64/gicv3/gicv3.c
 +++ b/test/vmapi/arch/aarch64/gicv3/gicv3.c
 @@ -42,7 +42,7 @@ static void irq(void)
@@ -46,6 +52,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
  	const uint32_t mode =3D MM_MODE_R | MM_MODE_W | MM_MODE_D;
  	hftest_mm_identity_map((void *)GICD_BASE, PAGE_SIZE, mode);
+diff --git a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h b/test/vmapi/arch=
/aarch64/gicv3/inc/gicv3.h
+index 5faf3a8..f681e58 100644
 --- a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
 +++ b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
 @@ -30,4 +30,4 @@ extern void *recv_buffer;
@@ -54,6 +62,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 =20
 -void system_setup();
 +void system_setup(void);
+diff --git a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c b/test/vmap=
i/arch/aarch64/gicv3/timer_secondary.c
+index ebc4db3..8260e10 100644
 --- a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
 +++ b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
 @@ -55,7 +55,7 @@ TEAR_DOWN(timer_secondary_ffa)
@@ -65,6 +75,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
  	const char message[] =3D "loop 0099999";
  	const char expected_response[] =3D "Got IRQ 03.";
+diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/test/v=
mapi/el0_partitions/services/interruptible.c
+index 0d00b16..3c3250d 100644
 --- a/test/vmapi/el0_partitions/services/interruptible.c
 +++ b/test/vmapi/el0_partitions/services/interruptible.c
 @@ -43,7 +43,7 @@ static void irq(void)
@@ -76,6 +88,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
  	struct ffa_value received;
 =20
+diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c b/t=
est/vmapi/el0_partitions/services/interruptible_echo.c
+index b618cf2..636ebc9 100644
 --- a/test/vmapi/el0_partitions/services/interruptible_echo.c
 +++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
 @@ -32,7 +32,7 @@ static void irq(void)
@@ -87,6 +101,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  {
  	struct ffa_value received;
 =20
+diff --git a/test/vmapi/primary_with_secondaries/services/interruptible.=
c b/test/vmapi/primary_with_secondaries/services/interruptible.c
+index cc1c1f9..c94093b 100644
 --- a/test/vmapi/primary_with_secondaries/services/interruptible.c
 +++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
 @@ -40,7 +40,7 @@ static void irq(void)
--=20
2.34.1


