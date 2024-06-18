Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52715C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:27:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89538.1718724461274516745
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 08:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8899BDA7;
	Tue, 18 Jun 2024 08:28:05 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.30.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 109C73F6A8;
	Tue, 18 Jun 2024 08:27:39 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH v2 5/5] ci,arm-bsp: corstone1000: New MACHINE_FEATURES for Corstone-1000 FVP multicore
Date: Tue, 18 Jun 2024 16:27:24 +0100
Message-Id: <20240618152724.7273-6-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
References: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 15:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5824

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Introduce `corstone1000_fvp_smp` as a value of the `MACHINE_FEATURES`
variable to support Corstone-1000 FVP Symmetric Multiprocessing.

A new YAML file is created to add this new machine only for the FVP
variant of the target platform.

The multicore feature is enabled in TrustedFirmware-A,
TrustedFirmware-M, and OP-TEE based on this machine feature.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 kas/corstone1000-fvp-multicore.yml                        | 8 ++++++++
 .../trusted-firmware-a-corstone1000.inc                   | 1 +
 .../trusted-firmware-m-corstone1000.inc                   | 1 +
 .../optee/optee-os-corstone1000-common.inc                | 2 ++
 4 files changed, 12 insertions(+)
 create mode 100644 kas/corstone1000-fvp-multicore.yml

diff --git a/kas/corstone1000-fvp-multicore.yml b/kas/corstone1000-fvp-mu=
lticore.yml
new file mode 100644
index 00000000..d806bb11
--- /dev/null
+++ b/kas/corstone1000-fvp-multicore.yml
@@ -0,0 +1,8 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+
+local_conf_header:
+  fvp-multicore: |
+    MACHINE_FEATURES +=3D "corstone1000_fvp_smp"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index b19e52aa..c53bc6cd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -55,3 +55,4 @@ EXTRA_OEMAKE:append =3D " \
                         BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
                         FVP_USE_GIC_DRIVER=3DFVP_GICV2 \
                         "
+EXTRA_OEMAKE:append:corstone1000-fvp =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'corstone1000_fvp_smp', ' ENABLE_MULTICORE=3D1', '', d)}"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index b362461e..4777251d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -10,6 +10,7 @@ TFM_DEBUG =3D "1"
 TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
+EXTRA_OECMAKE:append:corstone1000-fvp =3D " -DENABLE_MULTICORE=3D${@bb.u=
tils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp', 'TRUE', 'FALSE'=
, d)}"
=20
 SRC_URI +=3D " \
             file://0001-arm-trusted-firmware-m-disable-address-warnings-=
into.patch \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 4f4ed12a..22289087 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -17,3 +17,5 @@ EXTRA_OEMAKE +=3D " CFG_TEE_BENCHMARK=3Dn"
 EXTRA_OEMAKE +=3D " CFG_CORE_SEL1_SPMC=3Dy CFG_CORE_FFA=3Dy"
=20
 EXTRA_OEMAKE +=3D " CFG_WITH_SP=3Dy"
+
+EXTRA_OEMAKE:append:corstone1000-fvp =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'corstone1000_fvp_smp', ' CFG_TEE_CORE_NB_CORE=3D4', '', d)}"
--=20
2.25.1


