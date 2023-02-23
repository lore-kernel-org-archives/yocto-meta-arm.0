Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B604C678D5
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:37:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11953.1677163023168221042
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 06:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BBB0FEC
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:45 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61FAE3F881
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:02 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm/gn: update to a more recent SHA
Date: Thu, 23 Feb 2023 09:36:54 -0500
Message-Id: <20230223143657.424913-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223143657.424913-1-jon.mason@arm.com>
References: <20230223143657.424913-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4448

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 521e33e9..20832016 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49=
a14dfe2d11837bb34d"
=20
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
 \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
-SRCREV =3D "bf4e17dc67b2a2007475415e3f9e1d1cf32f6e35"
+SRCREV =3D "edf6ef4b06b42c58292faea78498aff76bdf68ed"
 PV =3D "0+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


