Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E43109C035
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 15:25:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25052.1774452357474212990
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 08:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=P+ZeDkDC;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10ACA22D7
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 08:25:51 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5C163F915
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774452357; bh=mKkGyzJr5pB5AWZ+INusrry05xTj77aDnqLL3f2sg+k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P+ZeDkDC5BEDdij/z9mRPYZZ4Tmq9b1/P2IYmZtFS6sLDIbjN14U+Z3x7/75MdVfC
	 aY2x1PBNVSz2zGlSLrJ75SR/Y+AGwCj9A2b/jANJsHzweRSny3imbWUzNzK7mtRYvx
	 Iuy3Kjw5HE3FfE5f1MpLNShIc63WQo2PlhA0vGAA=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/fvps: update to newer versions
Date: Wed, 25 Mar 2026 11:25:55 -0400
Message-ID: <20260325152555.84335-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260325152555.84335-1-jon.mason@arm.com>
References: <20260325152555.84335-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 15:25:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6970

New versions of the FVPs have been released.  Update the recipes to use
them.  License SHA changes caused by 3rd party software versions used
being modified and white space changes.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-rd-v3-r1.bb | 8 ++++----
 meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-rd-v3-r1.bb b/meta-arm/rec=
ipes-devtools/fvp/fvp-rd-v3-r1.bb
index a0de2a5baa6b..e54f31903147 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-rd-v3-r1.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-rd-v3-r1.bb
@@ -2,16 +2,16 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "RD-V3-r1"
 MODEL_CODE =3D "FVP_RD_V3_R1"
-PV =3D "11.27.51"
+PV =3D "11.29.35"
=20
 SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ne=
overse-Infrastructure/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;su=
bdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
-SRC_URI[fvp-aarch64.sha256sum] =3D "6b25961a7dcac99ff5d2c63f297e1598b05e=
67938d71353b37c82e3d58d7ac3c"
-SRC_URI[fvp-x86_64.sha256sum] =3D "72f659ee3554ab0330984f35b2d640ea6553b=
bcbbf77cc485555be14277e4bc3"
+SRC_URI[fvp-aarch64.sha256sum] =3D "feb805bcb76921c926ff582c35f5f8cedfb9=
f15294cf873243de1018bf32e30f"
+SRC_URI[fvp-x86_64.sha256sum] =3D "f1c77d0c50dea01a5dd4ea6fbe548919abc0d=
63f281f8378f6d9fa83932e36cc"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D9ddd501715f7e1fed82c57b260b020ba"
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D41f1533ebfbd4f1d32cfc82b55f6729a"
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb b/meta-arm/recip=
es-devtools/fvp/fvp-rd1-ae.bb
index bf5671f09c13..e305afae96c4 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-rd1-ae.bb
@@ -2,16 +2,16 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "RD-1_AE"
 MODEL_CODE =3D "FVP_RD_1_AE"
-PV =3D "11.27.20"
+PV =3D "11.29.27"
=20
 SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Au=
tomotive/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP};=
name=3Dfvp-${HOST_ARCH}"
-SRC_URI[fvp-aarch64.sha256sum] =3D "297ded55d025772c9ad8497c6a97e0619fc1=
762dd1236e3ddec14da449f51ca4"
-SRC_URI[fvp-x86_64.sha256sum] =3D "e2b01fafac9cd560ed7a42f155241971d0cef=
086404c56bbb44dc6c9bf672e7d"
+SRC_URI[fvp-aarch64.sha256sum] =3D "4801691619edeadb861bd8ede783264fc492=
c83525af4739e8c122a8a96e850a"
+SRC_URI[fvp-x86_64.sha256sum] =3D "fefdfdb495f72d6187a03cee31d0d87ebd85c=
e8bcac69a006861999f0452e3a7"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Da3ce84371977a6b9c624408238309a90"
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D92ea58bb219213dfdc48111b693019b6"
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
--=20
2.50.1 (Apple Git-155)


