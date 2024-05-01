Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1B0C25B10
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 12:32:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11415.1714566715752145807
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 May 2024 05:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 952412F4
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:32:21 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5442B3F73F
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:31:55 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/fvp-corstone1000: tweak the versioning
Date: Wed,  1 May 2024 08:31:53 -0400
Message-Id: <20240501123154.62576-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240501123154.62576-1-jon.mason@arm.com>
References: <20240501123154.62576-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 12:32:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5682

Modify the versioning to get it to play nice with `devtool check-upgrade-=
status`

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm=
/recipes-devtools/fvp/fvp-corstone1000.bb
index 4ac9a6ca5d7a..aef9edde510d 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -2,12 +2,14 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Corstone-1000"
 MODEL_CODE =3D "FVP_Corstone_1000"
-PV =3D "11.23_25"
+PV =3D "11.23.25"
=20
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV}_${FVP_ARCH}.tgz;subdir=3D=
${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;sub=
dir=3D${BP};name=3Dfvp-${HOST_ARCH}"
 SRC_URI[fvp-aarch64.sha256sum] =3D "e299e81d5fa8b3d2afee0850fd03be31c1a1=
c3fad07f79849c63e46ee5e36acc"
 SRC_URI[fvp-x86_64.sha256sum] =3D "ec34c9564ccb5b1eb62fc2757673343a353db=
1d116a7cb1b5f82f9d985d99cdf"
=20
+UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+)_${FVP_A=
RCH}\.tgz"
+
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D0c32ac6f58ebff83065105042ab98211"
=20
--=20
2.39.3 (Apple Git-146)


