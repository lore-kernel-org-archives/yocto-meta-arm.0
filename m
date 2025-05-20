Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F8CC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27024.1747762089697576867
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD3E11516;
	Tue, 20 May 2025 10:27:55 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7D123F5A1;
	Tue, 20 May 2025 10:28:08 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 4/9] arm/trusted-services: simplify SmmGW configuration
Date: Tue, 20 May 2025 19:27:42 +0200
Message-ID: <20250520172748.3439803-4-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6511

Bound Authenticated Variable configuration related settings to yocto
variables. The aim is easier configuration by hiding SmmGW build system
internals at the yocto recipe level.

For details please see documentation/trusted-services.md

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 ci/fvp-base-ts.yml                                   |  2 ++
 documentation/trusted-services.md                    | 12 ++++++++++++
 meta-arm-bsp/conf/machine/include/corstone1000.inc   |  5 +++++
 .../trusted-services/ts-sp-smm-gateway_%.bbappend    |  2 --
 .../trusted-services/ts-sp-smm-gateway_git.bb        |  3 +++
 5 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
index 9f13bac7..89a3e1f2 100644
--- a/ci/fvp-base-ts.yml
+++ b/ci/fvp-base-ts.yml
@@ -15,6 +15,8 @@ local_conf_header:
     MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
     MACHINE_FEATURES:append =3D " ts-attestation ts-smm-gateway optee-sp=
mc-test"
     MACHINE_FEATURES:append =3D " ts-block-storage ts-fwu"
+    MACHINE_FEATURES:append =3D " arm-branch-protection"
+    SMMGW_AUTH_VAR =3D "1"
     # Include TS demo/test tools into image
     IMAGE_INSTALL:append =3D " packagegroup-ts-tests"
     # Include TS PSA Arch tests into image
diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index 636ccbf3..3dd045c7 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -57,6 +57,18 @@ Optionally for testing purposes you can add `packagegr=
oup-ts-tests` into your im
   meta-arm also includes Trusted Service OEQA tests which can be used fo=
r automated testing.
 See `ci/trusted-services.yml` for an example how to include them into an=
 image.
=20
+## Configuration options
+
+Some TS recipes support yocto variables to set build configuration. Thes=
e variables can be set in .conf files (machine
+specific or local.conf), or .bbappend files.=20
+
+SmmGW SP recipe supports the following configuration variables
+
+| Variable name         | Type | Description                            =
                                                                |
+|-----------------------|------|----------------------------------------=
----------------------------------------------------------------|
+| SMMGW_AUTH_VAR        | Bool | Enable Authenticated variable support  =
                                                                |
+| SMMGW_INTERNAL_CRYPTO | Bool | Use MbedTLS build into SmmGW for authen=
tication related crypto operations. Depends on SMMGW_AUTH_VAR=3D1 |
+
=20
 ------
 [^1]: https://trusted-services.readthedocs.io/en/integration/overview/in=
dex.html
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 57207499..80ff9bbe 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -67,3 +67,8 @@ ARM_SYSTEMREADY_ACS_CONSOLE ?=3D "default"
=20
 # Workaround IMAGE_ROOTFS_EXTRA_SPACE being ignored when images are repa=
cked
 IMAGE_ROOTFS_EXTRA_ARGS +=3D "--extra-space ${@${IMAGE_ROOTFS_EXTRA_SPAC=
E}}K"
+
+# Enable Authenticated variable support in SmmGW
+SMMGW_AUTH_VAR=3D"1"
+# Use MbedTLS build into SmmGW for authentication related crypto operati=
ons.
+SMMGW_INTERNAL_CRYPTO=3D"1"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gat=
eway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-sm=
m-gateway_%.bbappend
index 628dfb48..3d8f0d25 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
@@ -2,8 +2,6 @@ require ts-arm-platforms.inc
=20
 EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
-    -DUEFI_AUTH_VAR=3DON \
-    -DUEFI_INTERNAL_CRYPTO=3DON \
     -DSMM_GATEWAY_MAX_UEFI_VARIABLES=3D60 \
     "
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway=
_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_gi=
t.bb
index d72e8946..2ca43c78 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
@@ -6,3 +6,6 @@ SP_UUID =3D "${SMM_GATEWAY_UUID}"
 TS_SP_SMM_GATEWAY_CONFIG ?=3D "default"
=20
 OECMAKE_SOURCEPATH =3D "${S}/deployments/smm-gateway/config/${TS_SP_SMM_=
GATEWAY_CONFIG}-${TS_ENV}"
+
+EXTRA_OECMAKE:append =3D "${@oe.utils.vartrue("SMMGW_AUTH_VAR", " -DUEFI=
_AUTH_VAR=3DON ", "", d)}"
+EXTRA_OECMAKE:append =3D "${@oe.utils.ifelse(oe.types.boolean(d.getVar("=
SMMGW_AUTH_VAR")) and oe.types.boolean(d.getVar("SMMGW_INTERNAL_CRYPTO"))=
, " -DUEFI_INTERNAL_CRYPTO=3DOn ", "")}"
--=20
2.43.0


