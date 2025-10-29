Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64599CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:50:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6477.1761745835660417679
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 06:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 718FB1AC1
	for <meta-arm@lists.yoctoproject.org>; Wed, 29 Oct 2025 06:50:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E36143F673
	for <meta-arm@lists.yoctoproject.org>; Wed, 29 Oct 2025 06:50:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-systemready/arm-systemready-linux-distros-debian: update for license rename
Date: Wed, 29 Oct 2025 13:50:33 +0000
Message-ID: <20251029135033.2994663-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Oct 2025 13:50:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6746

The SMAIL_GPL license in oe-core was renamed SMAIL-GPL to match SPDX.
Update the recipe to match this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../arm-systemready-linux-distros-debian.bb                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-debian.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-debian=
.bb
index fa395f05d4..cb23388f49 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
@@ -8,7 +8,7 @@ require arm-systemready-linux-distros.inc
 LICENSE =3D "AFL-2.0 & AFL-2.1 \
            & GPL-1.0-only & GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or=
-later & GPL-2.0-with-autoconf-exception \
            & GPL-2.0-with-OpenSSL-exception & GPL-3.0-only & GPL-3.0-or-=
later & GPL-3.0-with-autoconf-exception \
-           & GPL-3-with-bison-exception & SMAIL_GPL & LGPL-2.0-only & LG=
PL-2.0-or-later & LGPL-2.1-only \
+           & GPL-3-with-bison-exception & SMAIL-GPL & LGPL-2.0-only & LG=
PL-2.0-or-later & LGPL-2.1-only \
            & LGPL-2.1-or-later & LGPL-3.0-only & LGPL-3.0-or-later & BSD=
-2-Clause & BSD-3-Clause \
            & BSD-3-Clause-Clear & BSD-4-Clause & BSD-4-Clause-UC & TCP-w=
rappers & OLDAP-2.8 & PSF-2.0 & BSL-1.0 \
            & bzip2-1.0.6 & CC0-1.0 & Libpng & Latex2e & Unicode-TOU & Un=
icode-DFS-2016 & CC-BY-3.0 & CC-BY-SA-3.0 \
@@ -31,7 +31,7 @@ file://${COMMON_LICENSE_DIR}/GPL-3.0-only;md5=3Dc79ff39=
f19dfec6d293b95dea7b07891 \
 file://${COMMON_LICENSE_DIR}/GPL-3.0-or-later;md5=3D1c76c4cc354acaac30ed=
4d5eefea7245 \
 file://${COMMON_LICENSE_DIR}/GPL-3.0-with-autoconf-exception;md5=3Dda26b=
415cb0faf9bfe6829f0ffa409ec \
 file://${COMMON_LICENSE_DIR}/GPL-3-with-bison-exception;md5=3D6e1bac3dc2=
1fcc4fa049cf5c407eb7a2 \
-file://${COMMON_LICENSE_DIR}/SMAIL_GPL;md5=3Db948675029f79c64840e78881e9=
1e1d4 \
+file://${COMMON_LICENSE_DIR}/SMAIL-GPL;md5=3D785f3688caca0adb413cd39878d=
0411f \
 file://${COMMON_LICENSE_DIR}/LGPL-2.0-only;md5=3D9427b8ccf5cf3df47c29110=
424c9641a \
 file://${COMMON_LICENSE_DIR}/LGPL-2.0-or-later;md5=3D6d2d9952d88b50a51a5=
c73dc431d06c7 \
 file://${COMMON_LICENSE_DIR}/LGPL-2.1-only;md5=3D1a6d268fd218675ffea8be5=
56788b780 \
--=20
2.43.0


