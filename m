Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C33C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:46:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29861.1644428781066970802
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 09:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CC05ED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36C743F73B
	for <meta-arm@lists.yoctoproject.org>; Wed,  9 Feb 2022 09:46:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/ffa-debugfs-mod: remove redundant RPROVIDES
Date: Wed,  9 Feb 2022 17:46:08 +0000
Message-Id: <20220209174610.3824795-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 17:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2966

There's no need for ffa-debugfs-mod to RPROVIDE
kernel-module-arm-ffa-user, as this is provided by a sub-package of this
recipe already.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb=
 b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index 2db8afc1..4fedad1c 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -21,8 +21,6 @@ SRC_URI:append =3D " \
 FILES:${PN} +=3D "${bindir}/load_ffa_debugfs.sh"
 FILES:${PN}-dev +=3D "${includedir}/arm_ffa_user.h"
=20
-RPROVIDES:${PN} +=3D "kernel-module-arm-ffa-user"
-
 do_install:append() {
   install -D -p -m 0755 ${B}/load_ffa_debugfs.sh ${D}/${bindir}/load_ffa=
_debugfs.sh
   install -m 0644 ${S}/arm_ffa_user.h ${D}/${includedir}/arm_ffa_user.h
--=20
2.25.1


