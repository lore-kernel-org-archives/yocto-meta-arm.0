Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E03FD8775
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:43:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76259.1773754995253073649
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE66516F2;
	Tue, 17 Mar 2026 06:43:08 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6450A3F778;
	Tue, 17 Mar 2026 06:43:14 -0700 (PDT)
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 1/3] arm-bsp: corstone1000: Make multicore configuration platform-agnostic
Date: Tue, 17 Mar 2026 13:42:55 +0000
Message-ID: <20260317134259.493017-2-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317134259.493017-1-alex.chapman@arm.com>
References: <20260317134259.493017-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6957

To improve portability, testing coverage, and future platform enablement.

- Gate multicore on `MACHINE_FEATURES +=3D "corstone1000_smp"`.
- Change recipe overrides from `:corstone1000-fvp` to `:corstone1000`.
- Update the Corstone-1000 multicore kas/doc references.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
---
 ...stone1000-fvp-multicore.yml =3D> corstone1000-multicore.yml} | 4 ++--
 meta-arm-bsp/documentation/corstone1000/user-guide.rst        | 4 ++--
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc    | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc    | 2 +-
 .../recipes-security/optee/optee-os-corstone1000-common.inc   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename kas/{corstone1000-fvp-multicore.yml =3D> corstone1000-multicore.y=
ml} (69%)

diff --git a/kas/corstone1000-fvp-multicore.yml b/kas/corstone1000-multic=
ore.yml
similarity index 69%
rename from kas/corstone1000-fvp-multicore.yml
rename to kas/corstone1000-multicore.yml
index d806bb11..402ce956 100644
--- a/kas/corstone1000-fvp-multicore.yml
+++ b/kas/corstone1000-multicore.yml
@@ -4,5 +4,5 @@ header:
   version: 14
=20
 local_conf_header:
-  fvp-multicore: |
-    MACHINE_FEATURES +=3D "corstone1000_fvp_smp"
+  multicore: |
+    MACHINE_FEATURES +=3D "corstone1000_smp"
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 95dd60b7..18086d25 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -2189,13 +2189,13 @@ Symmetric Multiprocessing
=20
     .. code-block:: console
=20
-        kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-fvp-multicore.yml
+        kas build meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-multicore.yml
=20
 #. Run the Corstone-1000 FVP:
=20
     .. code-block:: console
=20
-        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-fvp-multicore.yml \
+        kas shell meta-arm/kas/corstone1000-fvp.yml:meta-arm/ci/debug.ym=
l:meta-arm/kas/corstone1000-multicore.yml \
         -c "../meta-arm/scripts/runfvp"
=20
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index d7c436dc..a6621145 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -58,7 +58,7 @@ EXTRA_OEMAKE:append =3D " \
                         BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
                         FVP_USE_GIC_DRIVER=3D${FVP_GIC_DRIVER} \
                         "
-EXTRA_OEMAKE:append:corstone1000-fvp =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'corstone1000_fvp_smp', ' ENABLE_MULTICORE=3D1', '', d)}"
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'corst=
one1000_smp', ' ENABLE_MULTICORE=3D1', '', d)}"
=20
 # Add Cortex-A320 specific configurations
 EXTRA_OEMAKE:append:cortexa320 =3D " \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index fe2c05a0..72144df0 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -26,7 +26,7 @@ EXTRA_OECMAKE:append:cortexa320 =3D " \
=20
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
-EXTRA_OECMAKE:append:corstone1000-fvp =3D " -DENABLE_MULTICORE=3D${@bb.u=
tils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp', 'TRUE', 'FALSE'=
, d)}"
+EXTRA_OECMAKE:append =3D " -DENABLE_MULTICORE=3D${@bb.utils.contains('MA=
CHINE_FEATURES', 'corstone1000_smp', 'TRUE', 'FALSE', d)}"
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SECURE_=
DEBUG=3D${@bb.utils.contains('MACHINE_FEATURES', 'secure-debug', 'ON', 'O=
FF', d)}"
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${S}/external/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/t=
fm-psa-adac-build"
=20
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 304dd0a9..4a90ca3e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -19,7 +19,7 @@ EXTRA_OEMAKE +=3D " CFG_CORE_SEL1_SPMC=3Dy CFG_CORE_FFA=
=3Dy"
=20
 EXTRA_OEMAKE +=3D " CFG_WITH_SP=3Dy"
=20
-EXTRA_OEMAKE:append:corstone1000-fvp =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'corstone1000_fvp_smp', ' CFG_TEE_CORE_NB_CORE=3D4', '', d)}"
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'corst=
one1000_smp', ' CFG_TEE_CORE_NB_CORE=3D4', '', d)}"
=20
 # Override OP-TEE OS ARM64 core architecture based on MACHINE_FEATURES
 CPUARCH =3D "cortex-a35"

