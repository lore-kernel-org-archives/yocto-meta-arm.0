Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DB0C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 15:26:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25888.1704468413595129096
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 07:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B311C15
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Jan 2024 07:27:39 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FB643F7A6
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Jan 2024 07:26:52 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: modify patches to have email headers and correct date fields
Date: Thu,  4 Jan 2024 14:42:02 -0600
Message-Id: <20240104204202.26953-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 15:26:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5309

Scripts processing data for the patch ages need correct information in
the relevant fields to determine the age.  Create/correct this
information where missing/incorrect.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/files/rwx-segments.patch | 15 +++++++++++----
 .../files/tf-a-tests-no-warn-rwx-segments.patch | 13 ++++++++++---
 ...-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch | 13 +++++++++----
 .../trusted-services/files/nanopb-upgrade.patch | 17 ++++++++++++++---
 4 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments=
.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.pat=
ch
index a4518ec6..403381c9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.patch
@@ -1,4 +1,8 @@
-Binutils 2.39 now warns when a segment has RXW permissions[1]:
+From 051c723a6463a579b05dcaa81f204516737a3645 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 9 Aug 2023 15:56:03 -0400
+Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW
+ permissions[1]:
=20
 aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
 permissions
@@ -13,12 +17,15 @@ remove --fatal-warnings.
=20
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/Makefile b/Makefile
-index 3941f8698..13bbac348 100644
+index 1ddb7b84417d..9eae30c923ec 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -418,7 +418,7 @@ TF_LDFLAGS		+=3D	$(TF_LDFLAGS_$(ARCH))
+@@ -425,7 +425,7 @@ TF_LDFLAGS		+=3D	$(TF_LDFLAGS_$(ARCH))
  # LD =3D gcc (used when GCC LTO is enabled)
  else ifneq ($(findstring gcc,$(notdir $(LD))),)
  # Pass ld options with Wl or Xlinker switches
@@ -27,7 +34,7 @@ index 3941f8698..13bbac348 100644
  TF_LDFLAGS		+=3D	-Wl,--gc-sections
  ifeq ($(ENABLE_LTO),1)
  	ifeq (${ARCH},aarch64)
-@@ -435,7 +435,7 @@ TF_LDFLAGS		+=3D	$(subst --,-Xlinker --,$(TF_LDFLAGS_$=
(ARCH)))
+@@ -442,7 +442,7 @@ TF_LDFLAGS		+=3D	$(subst --,-Xlinker --,$(TF_LDFLAGS_$=
(ARCH)))
=20=20
  # LD =3D gcc-ld (ld) or llvm-ld (ld.lld) or other
  else
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tf-a-tests-n=
o-warn-rwx-segments.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/fil=
es/tf-a-tests-no-warn-rwx-segments.patch
index 5d02e353..0193e8cc 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-warn-=
rwx-segments.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-warn-=
rwx-segments.patch
@@ -1,4 +1,8 @@
-Binutils 2.39 now warns when a segment has RXW permissions[1]:
+From 6635341615a5bcb36ce71479ee30dae1599081e2 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <anrton.antonov@arm.com>
+Date: Wed, 9 Aug 2023 15:56:03 -0400
+Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW
+ permissions[1]:
=20
 aarch64-poky-linux-musl-ld: tftf.elf has a LOAD segment with RWX permissio=
ns
=20
@@ -10,12 +14,15 @@ disable the warning
=20
 Upstream-Status: Inappropriate
 Signed-off-by: Anton Antonov <anrton.antonov@arm.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile b/Makefile
-index 6d0774e1..be3f84ce 100644
+index 286a47c7d454..3481187b62cf 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -238,7 +238,7 @@ TFTF_SOURCES		:=3D ${FRAMEWORK_SOURCES}	${TESTS_SOURCE=
S} ${PLAT_SOURCES} ${LIBC_SR
+@@ -246,7 +246,7 @@ TFTF_SOURCES		:=3D ${FRAMEWORK_SOURCES}	${TESTS_SOURCE=
S} ${PLAT_SOURCES} ${LIBC_SR
  TFTF_INCLUDES		+=3D ${PLAT_INCLUDES}
  TFTF_CFLAGS		+=3D ${COMMON_CFLAGS}
  TFTF_ASFLAGS		+=3D ${COMMON_ASFLAGS}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1=
Sdp-Reserve-OP-TEE-Region-from-UEFI.patch b/meta-arm-bsp/recipes-bsp/uefi/f=
iles/n1sdp/0009-Platform-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch
index 00c85ebc..0fdf9ee3 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp-Res=
erve-OP-TEE-Region-from-UEFI.patch
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp-Res=
erve-OP-TEE-Region-from-UEFI.patch
@@ -1,7 +1,6 @@
-From 235fabb2269a86e016bab2886b9129c77f0fea71 Wed Oct 11 16:18:22 2023
+From f2a76d6595b31b0bc1be7029277676af1b1cc3d3 Mon Sep 17 00:00:00 2001
 From: Mariam Elshakfy <mariam.elshakfy@arm.com>
-Date: Wed Oct 11 16:18:22 2023 +0000
-
+Date: Wed, 11 Oct 2023 16:18:22 +0000
 Subject: [PATCH] Platform/ARM/N1Sdp: Reserve OP-TEE Region from UEFI
=20
 To enable cache on N1SDP, OP-TEE has to be moved
@@ -11,6 +10,12 @@ known to application side, it must be reserved
 Upstream-Status: Pending (not yet submitted to upstream)
 Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
=20
+---
+ .../Library/PlatformLib/PlatformLib.inf             |  3 +++
+ .../Library/PlatformLib/PlatformLibMem.c            | 13 +++++++++++++
+ Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec         |  4 ++++
+ 3 files changed, 20 insertions(+)
+
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
 index 78f309c3aa..dc82d5bd87 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
@@ -50,7 +55,7 @@ index 8bb9407490..d8ad0f975c 100644
      EFI_RESOURCE_SYSTEM_MEMORY,=0D
      ResourceAttributes,=0D
 diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
-index 9e257ebde0..b400b94fd5 100644
+index 9e257ebde0..587319262a 100644
 --- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
 +++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
 @@ -86,5 +86,9 @@
diff --git a/meta-arm/recipes-security/trusted-services/files/nanopb-upgrad=
e.patch b/meta-arm/recipes-security/trusted-services/files/nanopb-upgrade.p=
atch
index 3e21f553..9ae4c6f2 100644
--- a/meta-arm/recipes-security/trusted-services/files/nanopb-upgrade.patch
+++ b/meta-arm/recipes-security/trusted-services/files/nanopb-upgrade.patch
@@ -1,3 +1,8 @@
+From 35d16cdfd51aeca5df70732accc89e250af86b69 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 29 Sep 2023 16:21:26 +0100
+Subject: [PATCH] Upgrade nanopb
+
 Upgrade the nanopb checkout to 0.4.7 plus some important build fixes, and
 change the build/install process to be more reliable.
=20
@@ -6,10 +11,16 @@ current state.
=20
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ external/nanopb/fix-pyhon-name.patch       | 41 ----------------------
+ external/nanopb/nanopb-init-cache.cmake.in |  6 +++-
+ external/nanopb/nanopb.cmake               |  7 ++--
+ 3 files changed, 8 insertions(+), 46 deletions(-)
+ delete mode 100644 external/nanopb/fix-pyhon-name.patch
=20
 diff --git a/external/nanopb/fix-pyhon-name.patch b/external/nanopb/fix-py=
hon-name.patch
 deleted file mode 100644
-index ab0e84c..0000000
+index ab0e84c550f4..000000000000
 --- a/external/nanopb/fix-pyhon-name.patch
 +++ /dev/null
 @@ -1,41 +0,0 @@
@@ -55,7 +66,7 @@ index ab0e84c..0000000
 -     endforeach()
 - endif()
 diff --git a/external/nanopb/nanopb-init-cache.cmake.in b/external/nanopb/=
nanopb-init-cache.cmake.in
-index fb8104d..8df41dd 100644
+index fb8104d64b26..8df41ddcb5eb 100644
 --- a/external/nanopb/nanopb-init-cache.cmake.in
 +++ b/external/nanopb/nanopb-init-cache.cmake.in
 @@ -12,11 +12,15 @@ set(BUILD_STATIC_LIBS On CACHE BOOL "")
@@ -76,7 +87,7 @@ index fb8104d..8df41dd 100644
 +
  @_cmake_fragment@
 diff --git a/external/nanopb/nanopb.cmake b/external/nanopb/nanopb.cmake
-index 36465f6..57cf3d6 100644
+index 36465f612d5d..57cf3d697fdd 100644
 --- a/external/nanopb/nanopb.cmake
 +++ b/external/nanopb/nanopb.cmake
 @@ -28,7 +28,7 @@ running this module.
--=20
2.30.2


