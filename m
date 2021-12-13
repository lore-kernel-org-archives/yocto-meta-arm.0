Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72DAC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:27:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11752.1639405641767094960
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 06:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E901139F
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 06:27:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCA7A3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 06:27:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/sbsa-acs: upgrade to 3.1
Date: Mon, 13 Dec 2021 14:27:12 +0000
Message-Id: <20211213142712.4080364-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213142712.4080364-1-ross.burton@arm.com>
References: <20211213142712.4080364-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 14:27:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2642

Remove a backported patch which has been incorporated in this release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-pal_uefi-Fix-enum-conversion.patch   | 30 -------------------
 .../uefi/{sbsa-acs_3.0.bb =3D> sbsa-acs_3.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-pal_uefi-Fix-=
enum-conversion.patch
 rename meta-arm/recipes-bsp/uefi/{sbsa-acs_3.0.bb =3D> sbsa-acs_3.1.bb} =
(83%)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-pal_uefi-Fix-enum-co=
nversion.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-pal_uefi-Fix-enu=
m-conversion.patch
deleted file mode 100644
index 5a874e39..00000000
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-pal_uefi-Fix-enum-conversio=
n.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d9101f353b16bf82fb0e8f1dac573aca97a6f3a7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Apr 2021 23:57:19 -0700
-Subject: [PATCH] pal_uefi: Fix enum conversion
-
-clang complains about enum type mismatches
-al_uefi/src/pal_gic.c:224:20: error: implicit conversion from enumeratio=
n type 'INTR_TRIGGER_INFO_TYPE_e' to different enumeration type 'EFI_HARD=
WARE_INTERRUPT2_TRIGGER_TYPE' [-Werror,-Wenum-conversion]
-
-Upstream-Status: Backport [a68f6bc5933d912a938baf841304b8637ff923ce]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- platform/pal_uefi/src/pal_gic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic=
.c b/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic.c
-index 7ce343d..b61aefc 100644
---- a/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic.c
-+++ b/ShellPkg/Application/sbsa-acs/platform/pal_uefi/src/pal_gic.c
-@@ -221,7 +221,7 @@ pal_gic_set_intr_trigger(UINT32 int_id, INTR_TRIGGER=
_INFO_TYPE_e trigger_type)
-   Status =3D gInterrupt2->SetTriggerType (
-                    gInterrupt2,
-                    int_id,
--                   trigger_type
-+                   (EFI_HARDWARE_INTERRUPT2_TRIGGER_TYPE)trigger_type
-                    );
-=20
-   if (EFI_ERROR(Status))
---=20
-2.31.1
-
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_3.1.bb
similarity index 83%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
rename to meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
index 3e0f6ab4..fabeeaef 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
@@ -3,14 +3,13 @@ require recipes-bsp/uefi/edk2-firmware_202111.bb
 LICENSE +=3D "& Apache-2.0"
 LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs/LICENSE.md;m=
d5=3D2a944942e1496af1886903d274dedb13"
=20
-SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/S=
hellPkg/Application/sbsa-acs;protocol=3Dhttps;branch=3Drelease;name=3Dacs=
 \
+SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/S=
hellPkg/Application/sbsa-acs;protocol=3Dhttps;branch=3Dmaster;name=3Dacs =
\
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-=
libc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
             file://shell.patch \
-            file://0001-pal_uefi-Fix-enum-conversion.patch \
             file://use_bfd_linker.patch \
             "
=20
-SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc803"
+SRCREV_acs =3D "ec02a7736ae5714326507c60595f4d5299e3dec8"
 SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
=20
 COMPATIBLE_HOST =3D "aarch64.*-linux"
--=20
2.25.1


