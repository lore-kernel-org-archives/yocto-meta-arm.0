Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3B0C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 16:55:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.20645.1661187309294406149
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 09:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3384C13D5;
	Mon, 22 Aug 2022 09:55:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681633F70D;
	Mon, 22 Aug 2022 09:55:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm/trusted-firmware-a: work around RWX permission error
 on segment
Date: Mon, 22 Aug 2022 17:55:04 +0100
Message-Id: <20220822165505.3603138-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822165505.3603138-1-ross.burton@arm.com>
References: <20220822165505.3603138-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Aug 2022 16:55:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3709

Binutils 2.39 now warns when a segment has RXW permissions[1]:

  aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX =
permissions

However, TF-A passes --fatal-warnings to LD, so this is a build failure.

There is a ticket filed upstream[2], so until that is resolved we can
disable this warning.

[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dba951=
afb99912da01a6e8434126b8fac7aa75107
[2] https://developer.trustedfirmware.org/T996

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/rwx-segments.patch                  | 38 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/rwx-seg=
ments.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/rwx-segments.p=
atch b/meta-arm/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch
new file mode 100644
index 00000000..a4518ec6
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch
@@ -0,0 +1,38 @@
+Binutils 2.39 now warns when a segment has RXW permissions[1]:
+
+aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
+permissions
+
+However, TF-A passes --fatal-warnings to LD, so this is a build failure.
+
+There is a ticket filed upstream[2], so until that is resolved just
+remove --fatal-warnings.
+
+[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dba95=
1afb99912da01a6e8434126b8fac7aa75107
+[2] https://developer.trustedfirmware.org/T996
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile b/Makefile
+index 3941f8698..13bbac348 100644
+--- a/Makefile
++++ b/Makefile
+@@ -418,7 +418,7 @@ TF_LDFLAGS		+=3D	$(TF_LDFLAGS_$(ARCH))
+ # LD =3D gcc (used when GCC LTO is enabled)
+ else ifneq ($(findstring gcc,$(notdir $(LD))),)
+ # Pass ld options with Wl or Xlinker switches
+-TF_LDFLAGS		+=3D	-Wl,--fatal-warnings -O1
++TF_LDFLAGS		+=3D	-O1
+ TF_LDFLAGS		+=3D	-Wl,--gc-sections
+ ifeq ($(ENABLE_LTO),1)
+ 	ifeq (${ARCH},aarch64)
+@@ -435,7 +435,7 @@ TF_LDFLAGS		+=3D	$(subst --,-Xlinker --,$(TF_LDFLAGS=
_$(ARCH)))
+=20
+ # LD =3D gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+-TF_LDFLAGS		+=3D	--fatal-warnings -O1
++TF_LDFLAGS		+=3D	-O1
+ TF_LDFLAGS		+=3D	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index c5b695e4..a8343434 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,7 +5,8 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
+SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster \
+           file://rwx-segments.patch"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
--=20
2.34.1


