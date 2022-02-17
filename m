Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA796C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:11:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1807.1645114274274539664
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:11:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D532B113E;
	Thu, 17 Feb 2022 08:11:13 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.87.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10DA93F718;
	Thu, 17 Feb 2022 08:11:12 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/6] arm/boot-wrapper-aarch64: Upgrade to newer revision
Date: Thu, 17 Feb 2022 16:09:54 +0000
Message-Id: <20220217160959.4157807-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217160959.4157807-1-peter.hoyes@arm.com>
References: <20220217160959.4157807-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:11:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3016

From: Peter Hoyes <Peter.Hoyes@arm.com>

Upgrade boot-wrapper-aarch64 to 1044c77062573985f7c994c3b6cef5695f57e955

Hold back gem5 at 8d5a765251d9113c3c0f9fa14de42a9e7486fe8a in bbappend.

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ia5ccca2234dd117d530970f9f90469dacbb778e3
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb           | 2 +-
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend       | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index 2251eff..74adaf3 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326febfb5fb909226c8e7=
ebcef5c"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster"
-SRCREV =3D "8d5a765251d9113c3c0f9fa14de42a9e7486fe8a"
+SRCREV =3D "1044c77062573985f7c994c3b6cef5695f57e955"
=20
 PV =3D "git${SRCPV}"
=20
diff --git a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarc=
h64_%.bbappend b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-=
aarch64_%.bbappend
index 57e6b53..3dd2cba 100644
--- a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.b=
bappend
+++ b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.b=
bappend
@@ -11,3 +11,6 @@ BOOT_WRAPPER_AARCH64_DEVICETREE:gem5-arm64 =3D "gem5-aa=
rch64.dtb"
 DEPLOY_DEPEND_LIST ?=3D ""
 DEPLOY_DEPEND_LIST:gem5-arm64 =3D " gem5-aarch64-dtb:do_deploy"
 do_deploy[depends] +=3D "${DEPLOY_DEPEND_LIST}"
+
+# The base recipe has been upgraded, so hold back at known working revis=
ion
+SRCREV =3D "8d5a765251d9113c3c0f9fa14de42a9e7486fe8a"
--=20
2.25.1


