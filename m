Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51362C3DA49
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 13:19:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.35997.1721913577727683274
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Jul 2024 06:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB4271007
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Jul 2024 06:20:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C45B43F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 25 Jul 2024 06:19:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-systemready: explicitly disable SPDX in the fake image classes
Date: Thu, 25 Jul 2024 14:19:04 +0100
Message-Id: <20240725131904.1934149-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Jul 2024 13:19:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5915

If SPDX 3.0 has been enabled then it :appends to IMAGE_CLASSES and then
breaks at build time because there are several classes and recipes that
look like but are not images.

Explicitly :remove the relevant class, but this really needs a better
solution in the long term.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-systemready/classes/extra_imagedepends_only.bbclass   | 2 ++
 .../recipes-test/arm-systemready-acs/arm-systemready-ir-acs.bb | 2 +-
 .../arm-systemready-linux-distros.inc                          | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm-systemready/classes/extra_imagedepends_only.bbclass=
 b/meta-arm-systemready/classes/extra_imagedepends_only.bbclass
index bf06a9f4..224b724e 100644
--- a/meta-arm-systemready/classes/extra_imagedepends_only.bbclass
+++ b/meta-arm-systemready/classes/extra_imagedepends_only.bbclass
@@ -23,3 +23,5 @@ do_rootfs[noexec] =3D "1"
 do_image[noexec] =3D "1"
 do_image_complete[noexec] =3D "1"
 do_build[depends] =3D ""
+
+IMAGE_CLASSES:remove =3D "create-spdx-image-3.0"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
index 7a709af5..83257b30 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
@@ -39,7 +39,7 @@ file://${COMMON_LICENSE_DIR}/Unicode-DFS-2016;md5=3D907=
371994d651afe53e98adc278246
 file://${COMMON_LICENSE_DIR}/Unicode-TOU;md5=3D666362dc5dba74f477af0f44f=
b85bd22 \
 file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8a157858e192597633=
 \
 "
-IMAGE_CLASSES:remove =3D "license_image"
+IMAGE_CLASSES:remove =3D "license_image create-spdx-image-3.0"
=20
 COMPATIBLE_MACHINE =3D "(fvp-.+|.+-fvp)"
=20
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros.inc b/meta-arm-systemready/recipes-test=
/arm-systemready-linux-distros/arm-systemready-linux-distros.inc
index 24dfc50a..fdca3cc0 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
@@ -2,7 +2,8 @@ SUMMARY =3D "Arm SystemReady Linux distros installation"
 DESCRIPTION =3D "Arm SystemReady Linux distro CD/DVD images and installa=
tion \
                target disk image"
=20
-IMAGE_CLASSES:remove =3D "license_image testimage"
+IMAGE_CLASSES:remove =3D "license_image testimage create-spdx-image-3.0"
+
 BUILDHISTORY_FEATURES:remove =3D "image"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
--=20
2.34.1


