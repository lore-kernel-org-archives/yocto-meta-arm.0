Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A557ECAC59E
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:00:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.641.1758034822578668685
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 08:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE6EFEC;
	Tue, 16 Sep 2025 08:00:13 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 987403F694;
	Tue, 16 Sep 2025 08:00:21 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 4/4] arm-bsp/ts:corstone1000: Rename patches
Date: Tue, 16 Sep 2025 16:00:13 +0100
Message-ID: <20250916150013.30666-5-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916150013.30666-1-hugues.kambampiana@arm.com>
References: <20250916150013.30666-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Sep 2025 15:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6714

Rename the Corstone-1000 Trusted Services patches so that their
numbering matches the application order, and the remainder of
each patch name matches its corresponding commit message subject.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 ...1000-Add-CORSTONE_1000_TYPE-variabl.patch} |  2 +-
 ...1000-Add-event-provider-proxy-for-b.patch} |  2 +-
 ...w-platform-override-of-FWU-mapping-.patch} |  2 +-
 ...CCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch} |  2 +-
 ...1000-Add-MM-communication-buffer-co.patch} |  0
 ...port-for-ESRT-v1-in-PSA-FWU-M-agent.patch} |  2 +-
 ...ing-warnings-as-errors-configurable.patch} |  2 +-
 ...config-Remove-Werror-compile-option.patch} |  2 +-
 ...09-fwu-proxy-refactor-image-mapping.patch} |  2 +-
 ...store-UEFI-variable-index-in-chunks.patch} |  0
 ..._HAS_ATTEST_PK-define-from-IAT-test.patch} |  0
 ...rypto-fix-AEAD-block-cypher-support.patch} |  2 +-
 .../trusted-services/ts-arm-platforms.inc     | 24 +++++++++----------
 13 files changed, 21 insertions(+), 21 deletions(-)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0009=
-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch =3D> 0001-pla=
tform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch} (97%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0016=
-platform-corstone1000-Add-event-provider-proxy.patch =3D> 0002-platform-=
corstone1000-Add-event-provider-proxy-for-b.patch} (99%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0017=
-platform-corstone1000-Define-GUID-for-each-payloads.patch =3D> 0003-fwu-=
se-proxy-Allow-platform-override-of-FWU-mapping-.patch} (99%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0013=
-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch =3D> 0004-fwu-C=
oerce-PSA_SUCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch} (97%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0018=
-Add-the-com-buffer-address-and-page-count.patch =3D> 0005-platform-corst=
one1000-Add-MM-communication-buffer-co.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0014=
-fwu-Add-EFI-ESRT-v1-support.patch =3D> 0006-fwu-Add-support-for-ESRT-v1-=
in-PSA-FWU-M-agent.patch} (99%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0022=
-Make-treating-warnings-as-errors-configurable.patch =3D> 0007-Make-treat=
ing-warnings-as-errors-configurable.patch} (99%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0003=
-Remove-Werror-flag.patch =3D> 0008-smm-gateway-config-Remove-Werror-comp=
ile-option.patch} (95%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0007=
-fwu-proxy-refactor-image-mapping.patch =3D> 0009-fwu-proxy-refactor-imag=
e-mapping.patch} (99%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0007=
-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch =3D> 0010-Reve=
rt-Load-and-store-UEFI-variable-index-in-chunks.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0004=
-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch =3D> 0011-Remov=
e-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0024=
-psa-crypto-fix-AEAD-block-cypher-support.patch =3D> 0012-psa-crypto-fix-=
AEAD-block-cypher-support.patch} (97%)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0001-platform-corsto=
ne1000-Add-CORSTONE_1000_TYPE-variabl.patch
similarity index 97%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
1-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
index 47fab7a1..18b6d7be 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
atform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-pl=
atform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
@@ -1,7 +1,7 @@
 From 2cd4db9828f244de77e402ad31c52d9c4ba3c600 Mon Sep 17 00:00:00 2001
 From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 Date: Tue, 5 Aug 2025 14:05:49 +0100
-Subject: [PATCH 1/7] platform: corstone1000: Add CORSTONE_1000_TYPE vari=
able
+Subject: [PATCH] platform: corstone1000: Add CORSTONE_1000_TYPE variable
  for platform selection
=20
 This change introduces a CORSTONE_1000_TYPE variable in both CMake
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-platform-corstone1000-Add-event-provider-proxy.patch b/meta-arm-bsp/=
recipes-security/trusted-services/corstone1000/0002-platform-corstone1000=
-Add-event-provider-proxy-for-b.patch
similarity index 99%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
016-platform-corstone1000-Add-event-provider-proxy.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
2-platform-corstone1000-Add-event-provider-proxy-for-b.patch
index 86868071..c5f2a0b9 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-pl=
atform-corstone1000-Add-event-provider-proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-pl=
atform-corstone1000-Add-event-provider-proxy-for-b.patch
@@ -1,7 +1,7 @@
 From 6a4cedce9d433bc42a71ac77c3cd90dde4242951 Mon Sep 17 00:00:00 2001
 From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 Date: Tue, 5 Aug 2025 15:22:44 +0100
-Subject: [PATCH 2/7] platform: corstone1000: Add event provider proxy fo=
r boot
+Subject: [PATCH] platform: corstone1000: Add event provider proxy for bo=
ot
  confirmation handling
=20
 This patch introduces an event forwarding framework to support
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0017-platform-corstone1000-Define-GUID-for-each-payloads.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0003-fwu-se-proxy-All=
ow-platform-override-of-FWU-mapping-.patch
similarity index 99%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
017-platform-corstone1000-Define-GUID-for-each-payloads.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
3-fwu-se-proxy-Allow-platform-override-of-FWU-mapping-.patch
index 8d13cedf..2a0e398a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-pl=
atform-corstone1000-Define-GUID-for-each-payloads.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-fw=
u-se-proxy-Allow-platform-override-of-FWU-mapping-.patch
@@ -1,7 +1,7 @@
 From a518c74b7ce050bba2d0aaece701086dc50ffa53 Mon Sep 17 00:00:00 2001
 From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 Date: Tue, 5 Aug 2025 13:54:13 +0100
-Subject: [PATCH 3/7] fwu:se-proxy: Allow platform override of FWU mappin=
g and
+Subject: [PATCH] fwu:se-proxy: Allow platform override of FWU mapping an=
d
  payload size
=20
 Allow platform override of FWU mapping and payload size
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0004-fwu-Coerce-PSA_SU=
CCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch
similarity index 97%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
4-fwu-Coerce-PSA_SUCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch
index 4ef78eb3..c171a70b 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Fi=
x-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-fw=
u-Coerce-PSA_SUCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.patch
@@ -1,7 +1,7 @@
 From 8b8eb4a2d512de06d3ee8a17dd9295cd38efd68d Mon Sep 17 00:00:00 2001
 From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 Date: Tue, 5 Aug 2025 14:42:17 +0100
-Subject: [PATCH 4/7] fwu: Coerce PSA_SUCCESS_REBOOT and PSA_SUCCESS_REST=
ART to
+Subject: [PATCH] fwu: Coerce PSA_SUCCESS_REBOOT and PSA_SUCCESS_RESTART =
to
  PSA_SUCCESS
=20
 Map `PSA_SUCCESS_REBOOT` and `PSA_SUCCESS_RESTART` (returned by
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Add-the-com-buffer-address-and-page-count.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0005-platform-corstone1000-Add-=
MM-communication-buffer-co.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
018-Add-the-com-buffer-address-and-page-count.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
5-platform-corstone1000-Add-MM-communication-buffer-co.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-fwu-Add-EFI-ESRT-v1-support.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0006-fwu-Add-support-for-ESRT-v1-in-PSA-FWU-M=
-agent.patch
similarity index 99%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
014-fwu-Add-EFI-ESRT-v1-support.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
6-fwu-Add-support-for-ESRT-v1-in-PSA-FWU-M-agent.patch
index c10a88a8..61ae510d 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-fw=
u-Add-EFI-ESRT-v1-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-fw=
u-Add-support-for-ESRT-v1-in-PSA-FWU-M-agent.patch
@@ -1,7 +1,7 @@
 From d5ca8c5b73c3ff3bc5c137828932e440c6a7f187 Mon Sep 17 00:00:00 2001
 From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 Date: Tue, 5 Aug 2025 15:05:33 +0100
-Subject: [PATCH 5/7] fwu: Add support for ESRT v1 in PSA FWU-M agent
+Subject: [PATCH] fwu: Add support for ESRT v1 in PSA FWU-M agent
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0022-Make-treating-warnings-as-errors-configurable.patch b/meta-arm-bsp/r=
ecipes-security/trusted-services/corstone1000/0007-Make-treating-warnings=
-as-errors-configurable.patch
similarity index 99%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
022-Make-treating-warnings-as-errors-configurable.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
7-Make-treating-warnings-as-errors-configurable.patch
index d79e9e99..75742285 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0022-Ma=
ke-treating-warnings-as-errors-configurable.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Ma=
ke-treating-warnings-as-errors-configurable.patch
@@ -1,7 +1,7 @@
 From 44e56b28f6a5ea9caab0bcccce3d02c59bb5d0ce Mon Sep 17 00:00:00 2001
 From: Gyorgy Szing <gyorgy.szing@arm.com>
 Date: Tue, 19 Aug 2025 11:07:39 +0200
-Subject: [PATCH 1/8] Make treating warnings as errors configurable
+Subject: [PATCH] Make treating warnings as errors configurable
=20
 Introduce the CMAKE_COMPILE_WARNING_AS_ERROR build option to control
 whether the project treats compiler warnings as errors. This option is
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0003-Remove-Werror-flag.patch b/meta-arm-bsp/recipes-security/trusted-ser=
vices/corstone1000/0008-smm-gateway-config-Remove-Werror-compile-option.p=
atch
similarity index 95%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
003-Remove-Werror-flag.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
8-smm-gateway-config-Remove-Werror-compile-option.patch
index 7d4f17e6..427f99c9 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Re=
move-Werror-flag.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-sm=
m-gateway-config-Remove-Werror-compile-option.patch
@@ -1,7 +1,7 @@
 From c50ad182f8375eacb315b894229eec7f4cad1b30 Mon Sep 17 00:00:00 2001
 From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
 Date: Fri, 18 Oct 2024 11:50:32 +0000
-Subject: [PATCH 6/7] smm-gateway/config: Remove `Werror` compile option
+Subject: [PATCH] smm-gateway/config: Remove `Werror` compile option
=20
 Adding `-Werror` to CMakeLists.txt unintended when
 originally committed.
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-fwu-proxy-refactor-image-mapping.patch b/meta-arm-bsp/recipes-securi=
ty/trusted-services/corstone1000/0009-fwu-proxy-refactor-image-mapping.pa=
tch
similarity index 99%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
007-fwu-proxy-refactor-image-mapping.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
9-fwu-proxy-refactor-image-mapping.patch
index 591ff58f..4db64306 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-fw=
u-proxy-refactor-image-mapping.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-fw=
u-proxy-refactor-image-mapping.patch
@@ -1,7 +1,7 @@
 From ca3870a123f3449407d460dcbc6bc0ba0d135e1e Mon Sep 17 00:00:00 2001
 From: Gyorgy Szing <gyorgy.szing@arm.com>
 Date: Tue, 26 Aug 2025 15:01:44 +0200
-Subject: [PATCH 7/7] fwu-proxy: refactor image mapping
+Subject: [PATCH] fwu-proxy: refactor image mapping
=20
 Stop defining the size of the image mapping and the number of mappings
 at different places (C code vs cmake). Move the number of images to the
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0010-Revert-Load-and-=
store-UEFI-variable-index-in-chunks.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
0-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0011-Remove-PLATFORM_H=
AS_ATTEST_PK-define-from-IAT-test.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
004-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
1-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0024-psa-crypto-fix-AEAD-block-cypher-support.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0012-psa-crypto-fix-AEAD-block-c=
ypher-support.patch
similarity index 97%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
024-psa-crypto-fix-AEAD-block-cypher-support.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
2-psa-crypto-fix-AEAD-block-cypher-support.patch
index ee016245..69f85ede 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0024-ps=
a-crypto-fix-AEAD-block-cypher-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-ps=
a-crypto-fix-AEAD-block-cypher-support.patch
@@ -1,7 +1,7 @@
 From 85c8535f448466cdbd773f7072a42203ebc6ae64 Mon Sep 17 00:00:00 2001
 From: Gabor Abonyi <gabor.abonyi@arm.com>
 Date: Fri, 4 Apr 2025 11:43:09 +0000
-Subject: [PATCH 01/25] psa-crypto: fix AEAD block cypher support
+Subject: [PATCH] psa-crypto: fix AEAD block cypher support
=20
 This change enables support for block cyphers that require input data
 to be processed in whole block-sized chunks.
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 703c07cb..092a2cb4 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -2,18 +2,18 @@ FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/c=
orstone1000:"
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000  =3D " \
-    file://0009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.pat=
ch \
-    file://0016-platform-corstone1000-Add-event-provider-proxy.patch \
-    file://0017-platform-corstone1000-Define-GUID-for-each-payloads.patc=
h \
-    file://0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch=
 \
-    file://0018-Add-the-com-buffer-address-and-page-count.patch \
-    file://0014-fwu-Add-EFI-ESRT-v1-support.patch \
-    file://0022-Make-treating-warnings-as-errors-configurable.patch \
-    file://0003-Remove-Werror-flag.patch \
-    file://0007-fwu-proxy-refactor-image-mapping.patch \
-    file://0007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
-    file://0004-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
-    file://0024-psa-crypto-fix-AEAD-block-cypher-support.patch \
+    file://0001-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.pat=
ch \
+    file://0002-platform-corstone1000-Add-event-provider-proxy-for-b.pat=
ch \
+    file://0003-fwu-se-proxy-Allow-platform-override-of-FWU-mapping-.pat=
ch \
+    file://0004-fwu-Coerce-PSA_SUCCESS_REBOOT-and-PSA_SUCCESS_RESTAR.pat=
ch \
+    file://0005-platform-corstone1000-Add-MM-communication-buffer-co.pat=
ch \
+    file://0006-fwu-Add-support-for-ESRT-v1-in-PSA-FWU-M-agent.patch \
+    file://0007-Make-treating-warnings-as-errors-configurable.patch \
+    file://0008-smm-gateway-config-Remove-Werror-compile-option.patch \
+    file://0009-fwu-proxy-refactor-image-mapping.patch \
+    file://0010-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
+    file://0011-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
+    file://0012-psa-crypto-fix-AEAD-block-cypher-support.patch \
 "
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"

