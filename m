Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A1AC5B573
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:48:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35844.1786384099749008756
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2026 10:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sXri1c7T;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BAD01655
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 10:48:15 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DCB6B3FAB1
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786384099; bh=CrbJtN21bG9o25Ek4QnMZ/DkbllXFt/5sscoZFxLV8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sXri1c7T/FbgJVRYeex9vFzGbL3CCRvrPfhf3zz9S8G39ETPYc2ATs+81Z3hvXVDa
	 xN9nb2r9vQHJPvaoUH8MWVeVa87c2mCxyJU9vXGpAVQOmYr+Z0IKRR23MiU/rSdNJh
	 xIj7vmQ6Br3qyb2uvvAR9+R5fFp89C8gXBBZL95Y=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/fvps: change COMPATIBLE_HOST default
Date: Mon, 10 Aug 2026 13:48:17 -0400
Message-ID: <20260810174817.89440-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810174817.89440-1-jon.mason@arm.com>
References: <20260810174817.89440-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 17:48:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7139

Make the COMPATIBLE_HOST in fvp-common.inc be both x86 and arm64, since
that is the large majority of the FVPs available.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb | 2 --
 meta-arm/recipes-devtools/fvp/fvp-common.inc             | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb   | 2 --
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb        | 2 --
 meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb              | 2 --
 meta-arm/recipes-devtools/fvp/fvp-rdn2.bb                | 2 --
 meta-arm/recipes-devtools/fvp/fvp-rdv2.bb                | 2 --
 meta-arm/recipes-devtools/fvp/fvp-rdv3-r1.bb             | 2 --
 meta-arm/recipes-devtools/fvp/fvp-tc3.bb                 | 2 ++
 9 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb
index 26557769a577..59c1ead938ae 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.32.19.bb
@@ -21,8 +21,6 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 MODEL_CODE =3D "FVP_Base_RevC_AEMvA"
 SHELL_SCRIPT_NAME =3D "${MODEL_CODE}_11.32_19_${FVP_ARCH}.sh"
=20
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
-
 INSANE_SKIP:${PN} +=3D "dev-so"
=20
 do_install() {
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 7f7d4ef5126a..7021036f99b9 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -15,7 +15,7 @@ Please refer to 'https://developer.arm.com/downloads/-/=
arm-ecosystem-fvps/eula'\
 ${@bb.utils.contains('BB_ENV_PASSTHROUGH_ADDITIONS', 'ARM_FVP_EULA_ACCEP=
T', ' and export ARM_FVP_EULA_ACCEPT to 1', '', d)}.\
 "
=20
-COMPATIBLE_HOST =3D "x86_64.*-linux"
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
=20
 # The architecture-specific download filename suffix
 FVP_ARCH:aarch64 =3D "Linux64_armv8l"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb b/met=
a-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
index 1c2e49338395..37f44eb2b1d4 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
@@ -40,6 +40,4 @@ do_install() {
     done
 }
=20
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
-
 INSANE_SKIP:${PN} +=3D "dev-so"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index b4288275c8fd..9618bf75f2c8 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -18,5 +18,3 @@ LIC_FILES_CHKSUM =3D "\
     file://license_terms/license_agreement.txt;md5=3D1a33828e132ba71861c=
11688dbb0bd16 \
     file://license_terms/third_party_licenses/third_party_licenses.txt;m=
d5=3D0c32ac6f58ebff83065105042ab98211 \
 "
-
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb b/meta-arm/recip=
es-devtools/fvp/fvp-rd1-ae.bb
index e305afae96c4..c9a1c529a734 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
@@ -13,5 +13,3 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D92ea58bb219213dfdc48111b693019b6"
-
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rdn2.bb b/meta-arm/recipes=
-devtools/fvp/fvp-rdn2.bb
index 73848bfbc4cf..17330974b801 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-rdn2.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-rdn2.bb
@@ -14,7 +14,5 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Db9005e55057311e41efe02ccfea8ea72"
=20
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
-
 require remove-execstack.inc
 REMOVE_EXECSTACKS:x86-64 =3D "${FVPDIR}/models/${FVP_ARCH_DIR}*/libarmct=
model.so"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rdv2.bb b/meta-arm/recipes=
-devtools/fvp/fvp-rdv2.bb
index 3da7075abcd0..3ac06880af02 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-rdv2.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-rdv2.bb
@@ -14,7 +14,5 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Db9005e55057311e41efe02ccfea8ea72"
=20
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
-
 require remove-execstack.inc
 REMOVE_EXECSTACKS:x86-64 =3D "${FVPDIR}/models/${FVP_ARCH_DIR}*/libarmct=
model.so"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rdv3-r1.bb b/meta-arm/reci=
pes-devtools/fvp/fvp-rdv3-r1.bb
index e54f31903147..a7e03e3522b5 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-rdv3-r1.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-rdv3-r1.bb
@@ -13,5 +13,3 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D41f1533ebfbd4f1d32cfc82b55f6729a"
-
-COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc3.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc3.bb
index 2b0f257db6db..1f91d4419f4c 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-tc3.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-tc3.bb
@@ -12,3 +12,5 @@ UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D58b552b918d097a8ba802168312d76b2"
+
+COMPATIBLE_HOST =3D "x86_64.*-linux"
--=20
2.50.1 (Apple Git-155)


