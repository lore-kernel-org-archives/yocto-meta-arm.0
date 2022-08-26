Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC5BECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 10:10:35 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.54])
 by mx.groups.io with SMTP id smtpd.web09.35413.1661508630259932215
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 03:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.54, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27QACdl6006401;
	Fri, 26 Aug 2022 11:12:39 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH] arm/tf-a-tests: work around RWX permission error on segment
Date: Fri, 26 Aug 2022 11:10:21 +0100
Message-Id: <20220826101021.784450-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Aug 2022 10:10:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3717

Binutils 2.39 now warns when a segment has RXW permissions[1]:

- aarch64-poky-linux-musl-ld: tftf.elf has a LOAD segment with RWX permissions
- NOTE: recipe tf-a-tests-2.7.0-r0: task do_compile: Failed

There is a ticket filed upstream[2], so until that is resolved we can
disable this warning.

Also let's move a similar tf-a patch from trusted-firmware-a.inc to trusted-firmware-a_2.7.0.bb
as the patch is for tf-a version 2.7.0 only

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
[2] https://developer.trustedfirmware.org/T996

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../tf-a-tests-no-warn-rwx-segments.patch     | 26 +++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_2.7.0.bb    |  3 ++-
 .../trusted-firmware-a/trusted-firmware-a.inc |  3 +--
 .../trusted-firmware-a_2.7.0.bb               |  2 ++
 4 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-warn-rwx-segments.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-warn-rwx-segments.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-warn-rwx-segments.patch
new file mode 100644
index 00000000..5d02e353
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-warn-rwx-segments.patch
@@ -0,0 +1,26 @@
+Binutils 2.39 now warns when a segment has RXW permissions[1]:
+
+aarch64-poky-linux-musl-ld: tftf.elf has a LOAD segment with RWX permissions
+
+There is a ticket filed upstream[2], so until that is resolved just
+disable the warning
+
+[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+[2] https://developer.trustedfirmware.org/T996
+
+Upstream-Status: Inappropriate
+Signed-off-by: Anton Antonov <anrton.antonov@arm.com>
+
+diff --git a/Makefile b/Makefile
+index 6d0774e1..be3f84ce 100644
+--- a/Makefile
++++ b/Makefile
+@@ -238,7 +238,7 @@ TFTF_SOURCES		:= ${FRAMEWORK_SOURCES}	${TESTS_SOURCES} ${PLAT_SOURCES} ${LIBC_SR
+ TFTF_INCLUDES		+= ${PLAT_INCLUDES}
+ TFTF_CFLAGS		+= ${COMMON_CFLAGS}
+ TFTF_ASFLAGS		+= ${COMMON_ASFLAGS}
+-TFTF_LDFLAGS		+= ${COMMON_LDFLAGS}
++TFTF_LDFLAGS		+= ${COMMON_LDFLAGS} --no-warn-rwx-segments
+ TFTF_EXTRA_OBJS 	:=
+ 
+ ifneq (${BP_OPTION},none)
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
index 0c06440f..645b2456 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
@@ -7,7 +7,8 @@ inherit deploy
 
 COMPATIBLE_MACHINE ?= "invalid"
 
-SRC_URI = "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https;branch=master"
+SRC_URI = "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https;branch=master \
+          file://tf-a-tests-no-warn-rwx-segments.patch"
 SRCREV ?= "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
 
 DEPENDS += "optee-os"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index a8343434..c5b695e4 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,8 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy
 
-SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master \
-           file://rwx-segments.patch"
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.0.bb
index 537ec320..35817c0c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.0.bb
@@ -3,6 +3,8 @@ require trusted-firmware-a.inc
 # TF-A v2.7
 SRCREV_tfa = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 
+SRC_URI += "file://rwx-segments.patch"
+
 LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
 # mbed TLS v2.28.0
-- 
2.25.1


