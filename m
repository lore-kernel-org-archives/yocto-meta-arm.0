Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B311AC3DA7F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 18:25:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2450.1722623135043224386
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 11:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A33BDA7
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:26:00 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70C603F766
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:25:33 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm: use devtool to clean-up patches
Date: Fri,  2 Aug 2024 14:25:23 -0400
Message-Id: <20240802182525.80611-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240802182525.80611-1-jon.mason@arm.com>
References: <20240802182525.80611-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 18:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5948

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-os/0003-optee-enable-clang-support.patch | 5 ++---
 ...runtime-revert-usage-of-plat_ic_has_interrupt_t.patch | 7 ++-----
 ...measured_boot.c-ignore-TPM-error-and-continue-w.patch | 9 +++------
 .../0001-Patch-in-the-paths-to-the-SBSA-test-suite.patch | 4 ++--
 .../0002-Enforce-using-good-old-BFD-linker.patch         | 4 ++--
 .../gator-daemon/0001-Include-missing-cstdint.patch      | 7 ++-----
 .../0001-daemon-mxml-Define-_GNU_SOURCE.patch            | 7 ++-----
 .../optee-ftpm/0001-add-enum-to-ta-flags.patch           | 4 ++--
 .../optee/optee-os/0003-optee-enable-clang-support.patch | 5 ++---
 9 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enab=
le-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os/000=
3-optee-enable-clang-support.patch
index 3c13ce3f028c..4718c36d5da1 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enable-clan=
g-support.patch
+++ b/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enable-clan=
g-support.patch
@@ -1,4 +1,4 @@
-From 59d4c190eae11c93b26cca5a7b005a17dadc8248 Mon Sep 17 00:00:00 2001
+From 1cd944e1953a8665db9019faddc8e7dc31ca20fa Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
@@ -10,13 +10,12 @@ compiler-rt. This is mitigated by including the varia=
ble as ammended.
 Upstream-Status: Pending
 ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
 Signed-off-by: Brett Warren <brett.warren@arm.com>
-
 ---
  mk/clang.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee8..1ebe2f702 100644
+index a045beee8482..1ebe2f702dcd 100644
 --- a/mk/clang.mk
 +++ b/mk/clang.mk
 @@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl31_runt=
ime-revert-usage-of-plat_ic_has_interrupt_t.patch b/meta-arm/recipes-bsp/=
trusted-firmware-a/files/0001-bl31_runtime-revert-usage-of-plat_ic_has_in=
terrupt_t.patch
index f6f054df5ae8..bd68c62b865c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl31_runtime-rev=
ert-usage-of-plat_ic_has_interrupt_t.patch
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-bl31_runtime-rev=
ert-usage-of-plat_ic_has_interrupt_t.patch
@@ -1,4 +1,4 @@
-From fd13a4d304da4233cb954329bf287ec9dfbb7367 Mon Sep 17 00:00:00 2001
+From 29fbd6207d1fcd357c59db124c9983b30b5ccaed Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Mon, 4 Dec 2023 10:20:21 -0500
 Subject: [PATCH] bl31_runtime: revert usage of plat_ic_has_interrupt_typ=
e
@@ -18,7 +18,7 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/bl31/interrupt_mgmt.c b/bl31/interrupt_mgmt.c
-index 68c7f10add21..8e888b676b35 100644
+index a2b2c06859b6..1bcaaf56f912 100644
 --- a/bl31/interrupt_mgmt.c
 +++ b/bl31/interrupt_mgmt.c
 @@ -47,9 +47,9 @@ static intr_type_desc_t intr_type_descs[MAX_INTR_TYPES=
];
@@ -33,6 +33,3 @@ index 68c7f10add21..8e888b676b35 100644
 =20
  	return -EINVAL;
  }
---=20
-2.30.2
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_meas=
ured_boot.c-ignore-TPM-error-and-continue-w.patch b/meta-arm/recipes-bsp/=
trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-error-and-c=
ontinue-w.patch
index 2d189d8e8c89..75103332e32e 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_bo=
ot.c-ignore-TPM-error-and-continue-w.patch
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-qemu_measured_bo=
ot.c-ignore-TPM-error-and-continue-w.patch
@@ -1,4 +1,4 @@
-From 1d1425bde8435d6e2b3e4f2b7bcb2eb293ef9601 Mon Sep 17 00:00:00 2001
+From b91c651e6d596cfe27448b19c8fb2f1168493827 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 15 Jan 2024 09:26:56 +0000
 Subject: [PATCH] qemu_measured_boot.c: ignore TPM error and continue wit=
h boot
@@ -18,10 +18,10 @@ Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/plat/qemu/qemu/qemu_measured_boot.c b/plat/qemu/qemu/qemu_m=
easured_boot.c
-index 122bb23b14..731b081c47 100644
+index 76a4da17e6a9..ec7f44d3720d 100644
 --- a/plat/qemu/qemu/qemu_measured_boot.c
 +++ b/plat/qemu/qemu/qemu_measured_boot.c
-@@ -79,7 +79,8 @@ void bl2_plat_mboot_finish(void)
+@@ -80,7 +80,8 @@ void bl2_plat_mboot_finish(void)
  		 * Note: In QEMU platform, OP-TEE uses nt_fw_config to get the
  		 * secure Event Log buffer address.
  		 */
@@ -31,6 +31,3 @@ index 122bb23b14..731b081c47 100644
  	}
 =20
  	/* Copy Event Log to Non-secure memory */
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-t=
o-the-SBSA-test-suite.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Pat=
ch-in-the-paths-to-the-SBSA-test-suite.patch
index 236245fe7923..6d626be5b8d3 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-S=
BSA-test-suite.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-S=
BSA-test-suite.patch
@@ -1,4 +1,4 @@
-From 3a164d9f17591a545d1eafa629b486d4a1563722 Mon Sep 17 00:00:00 2001
+From e7918dbd4a02be2a474534da3f1e565931a5e632 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 16 Feb 2023 21:53:25 +0000
 Subject: [PATCH] Patch in the paths to the SBSA test suite
@@ -10,7 +10,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
-index dd0d88603f11..91710c0795dc 100644
+index 557b0ec0f3d6..85b3f4fc65d0 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
 @@ -23,6 +23,8 @@
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-o=
ld-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-usi=
ng-good-old-BFD-linker.patch
index 284191d30b97..68a25c71c1d1 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-=
linker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-=
linker.patch
@@ -1,4 +1,4 @@
-From 6c403e3ccaae3bb3fd9d0ad220ed8ea98b2b1354 Mon Sep 17 00:00:00 2001
+From 365fb8ebbefaa3c642e18e3c3a16eeccfa0dcc82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Apr 2021 00:16:07 -0700
 Subject: [PATCH] Enforce using good old BFD linker
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_de=
f.template
-index 1bf62362b611..2b41be8d5a44 100755
+index c34ecfd557c5..153d097a2688 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
 @@ -747,7 +747,7 @@ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_C=
C_FLAGS) -mlittle-endian -fno-
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Inc=
lude-missing-cstdint.patch b/meta-arm/recipes-devtools/gator-daemon/gator=
-daemon/0001-Include-missing-cstdint.patch
index 294f804fb4a0..20e994e84e3f 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-mi=
ssing-cstdint.patch
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-mi=
ssing-cstdint.patch
@@ -1,4 +1,4 @@
-From 87745a6cad0f7819ac8f8d3826f5e228ebd843c5 Mon Sep 17 00:00:00 2001
+From 8fba2fe012648efb526d17688c8ed3e5e72f715c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 2 Feb 2023 16:39:26 -0800
 Subject: [PATCH] Include missing <cstdint>
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/daemon/xml/CurrentConfigXML.h b/daemon/xml/CurrentConfigXML=
.h
-index 0b239fd..d9047e3 100644
+index 0b239fdb1d70..d9047e3bc080 100644
 --- a/daemon/xml/CurrentConfigXML.h
 +++ b/daemon/xml/CurrentConfigXML.h
 @@ -1,6 +1,7 @@
@@ -27,6 +27,3 @@ index 0b239fd..d9047e3 100644
  #include <set>
  #include <string>
 =20
---=20
-2.39.1
-
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-dae=
mon-mxml-Define-_GNU_SOURCE.patch b/meta-arm/recipes-devtools/gator-daemo=
n/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
index d2460434f010..0cab34aeaa45 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxm=
l-Define-_GNU_SOURCE.patch
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxm=
l-Define-_GNU_SOURCE.patch
@@ -1,4 +1,4 @@
-From 04e2e924c3ab8da41343277746804dbcd7bf520d Mon Sep 17 00:00:00 2001
+From ab3b2c4a6f2ae839bf3bbcae97493ece574852a7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Aug 2022 16:49:52 -0700
 Subject: [PATCH] daemon/mxml: Define _GNU_SOURCE
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/daemon/mxml/mxml-string.c b/daemon/mxml/mxml-string.c
-index 678aeb9..c9cd153 100644
+index 678aeb9c7605..c9cd153030da 100644
 --- a/daemon/mxml/mxml-string.c
 +++ b/daemon/mxml/mxml-string.c
 @@ -13,6 +13,8 @@
@@ -26,6 +26,3 @@ index 678aeb9..c9cd153 100644
  #include "config.h"
 =20
 =20
---=20
-2.37.2
-
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enu=
m-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/000=
1-add-enum-to-ta-flags.patch
index 7c61105b7647..3506127cfd1a 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta=
-flags.patch
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta=
-flags.patch
@@ -1,4 +1,4 @@
-From cd7b41b30cf157338cfd5cda3c0f6f33164ad16d Mon Sep 17 00:00:00 2001
+From 2bb67529a8b6096fadd3dd0cf740beded9a01432 Mon Sep 17 00:00:00 2001
 From: Maxim Uvarov <maxim.uvarov@linaro.org>
 Date: Fri, 17 Apr 2020 12:05:53 +0100
 Subject: [PATCH] add enum to ta flags
@@ -13,7 +13,7 @@ Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defi=
nes.h b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
-index 92c33c1..e83619d 100644
+index 92c33c169320..e83619d55d3c 100644
 --- a/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
 +++ b/Samples/ARM32-FirmwareTPM/optee_ta/fTPM/user_ta_header_defines.h
 @@ -44,7 +44,7 @@
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-c=
lang-support.patch b/meta-arm/recipes-security/optee/optee-os/0003-optee-=
enable-clang-support.patch
index 3c13ce3f028c..253a01db2d31 100644
--- a/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-su=
pport.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0003-optee-enable-clang-su=
pport.patch
@@ -1,4 +1,4 @@
-From 59d4c190eae11c93b26cca5a7b005a17dadc8248 Mon Sep 17 00:00:00 2001
+From 9cf8ac4e6fcecb33af377e1a322f4841ed4e30ce Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Wed, 23 Sep 2020 09:27:34 +0100
 Subject: [PATCH] optee: enable clang support
@@ -10,13 +10,12 @@ compiler-rt. This is mitigated by including the varia=
ble as ammended.
 Upstream-Status: Pending
 ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
 Signed-off-by: Brett Warren <brett.warren@arm.com>
-
 ---
  mk/clang.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee8..1ebe2f702 100644
+index a045beee8482..1ebe2f702dcd 100644
 --- a/mk/clang.mk
 +++ b/mk/clang.mk
 @@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
--=20
2.39.3 (Apple Git-146)


