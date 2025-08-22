Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21B6CA0FEC
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 13:18:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9914.1755868695791807355
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 06:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E3C427DD
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 243243F63F
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 06:18:15 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm/gn: update to the latest SHA
Date: Fri, 22 Aug 2025 09:18:10 -0400
Message-Id: <20250822131813.93724-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250822131813.93724-1-jon.mason@arm.com>
References: <20250822131813.93724-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 13:18:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6675

Update gn to the latest SHA (commit from 08 Aug 2025).  There are 66
commits between the previous SHA and the new one.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 8573cd2ffbd9..abc81a9549fd 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49=
a14dfe2d11837bb34d"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
"
-SRCREV =3D "ab638bd7cbb9ac8468bf2fbe60c74ed4706a14a7"
+SRCREV =3D "4ce861fc06ec87ff74eb6a17ebbd55e4755ebdeb"
 PV =3D "0+git"
=20
 B =3D "${WORKDIR}/build"
--=20
2.39.5 (Apple Git-154)


