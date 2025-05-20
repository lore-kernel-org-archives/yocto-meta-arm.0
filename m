Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8D8C54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26830.1747762091869119699
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC021152B;
	Tue, 20 May 2025 10:27:57 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A71AF3F5A1;
	Tue, 20 May 2025 10:28:10 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 6/9] arm/trusted-services: enable the logging SP
Date: Tue, 20 May 2025 19:27:44 +0200
Message-ID: <20250520172748.3439803-6-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6513

The logging service provides an SPMC agonistic to create log messages.
The current version will simply dump the incoming log messages to a
setial line. Future versions could provide access to log messages from
the NWd, could encrypt the essages and perform more efficient when
logging large messages.

This change enables the logging SP on the fvp_base platform. All log
messages made by SPs after the boot phase will be sent to UART3.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 ci/fvp-base-ts.yml                                        | 2 +-
 documentation/trusted-services.md                         | 1 +
 .../trusted-services/ts-sp-logging_%.bbappend             | 1 +
 meta-arm/recipes-security/optee/optee-os-ts.inc           | 7 +++++++
 .../trusted-services/ts-sp-logging_git.bb                 | 8 ++++++++
 meta-arm/recipes-security/trusted-services/ts-uuid.inc    | 1 +
 6 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
logging_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-logg=
ing_git.bb

diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
index 89a3e1f2..62d7995b 100644
--- a/ci/fvp-base-ts.yml
+++ b/ci/fvp-base-ts.yml
@@ -14,7 +14,7 @@ local_conf_header:
     # Include all Secure Partitions into the image
     MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
     MACHINE_FEATURES:append =3D " ts-attestation ts-smm-gateway optee-sp=
mc-test"
-    MACHINE_FEATURES:append =3D " ts-block-storage ts-fwu"
+    MACHINE_FEATURES:append =3D " ts-block-storage ts-fwu ts-logging"
     MACHINE_FEATURES:append =3D " arm-branch-protection"
     SMMGW_AUTH_VAR =3D "1"
     # Include TS demo/test tools into image
diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index 3dd045c7..8b7f795a 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -24,6 +24,7 @@ features for each [Secure Partition][^2] you would like=
 to include:
 | se-proxy          | ts-se-proxy     |
 | smm-gateway       | ts-smm-gateway  |
 | spm-test[1-4]     | optee-spmc-test |
+| Logging           | ts-logging      |
=20
 Other steps depend on your machine/platform definition:
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-logging=
_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-loggin=
g_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-logging_%.bbap=
pend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/r=
ecipes-security/optee/optee-os-ts.inc
index 82545ccb..be4bf5bb 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -80,6 +80,13 @@ DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEA=
TURES', 'ts-block-storage',
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-block-=
storage', \
                                         ' ${TS_BIN}/${BLOCK_STORAGE_UUID=
}${SP_EXT}', '', d)}"
=20
+# Logging SP
+DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-loggin=
g', \
+                                        ' ts-sp-logging', '' , d)}"
+SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-loggin=
g', \
+                                        ' ${TS_BIN}/${LOGGING_SP_UUID}${=
SP_EXT}', '', d)}"
+
+
 EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', \
                         ' CFG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=
=3Dy \
                          SP_PATHS=3D"${SP_PATHS}" ', d)}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-logging_git=
.bb b/meta-arm/recipes-security/trusted-services/ts-sp-logging_git.bb
new file mode 100644
index 00000000..e40349ae
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-logging_git.bb
@@ -0,0 +1,8 @@
+DESCRIPTION =3D "Trusted Services logging service provider"
+
+require ts-sp-common.inc
+
+SP_UUID =3D "${LOGGING_SP_UUID}"
+TS_SP_LOGGING_CONFIG ?=3D "default"
+
+OECMAKE_SOURCEPATH=3D"${S}/deployments/logging/config/${TS_SP_LOGGING_CO=
NFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-uuid.inc b/met=
a-arm/recipes-security/trusted-services/ts-uuid.inc
index 810ffa5e..bcf0ee97 100644
--- a/meta-arm/recipes-security/trusted-services/ts-uuid.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
@@ -13,3 +13,4 @@ SPM_TEST3_UUID   =3D "23eb0100-e32a-4497-9052-2f11e584a=
fa6"
 SPM_TEST4_UUID   =3D "423762ed-7772-406f-99d8-0c27da0abbf8"
 FWU_UUID         =3D "6823a838-1b06-470e-9774-0cce8bfb53fd"
 BLOCK_STORAGE_UUID =3D "63646e80-eb52-462f-ac4f-8cdf3987519c"
+LOGGING_SP_UUID  =3D "da9dffbd-d590-40ed-975f-19c65a3d52d3"
--=20
2.43.0


