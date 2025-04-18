Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A295C369CA
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 13:12:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11291.1744981944479173100
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Apr 2025 06:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 229C514BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:21 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E103C3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 06:12:23 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/execstack: correct broken version
Date: Fri, 18 Apr 2025 09:12:22 -0400
Message-Id: <20250418131222.95241-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418131222.95241-1-jon.mason@arm.com>
References: <20250418131222.95241-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Apr 2025 13:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6475

`devtool check-upgrade-status` reports the new version as "20151030.",
which is the last tagged release.  Given that there are a number of
commits since that tag and the tree doesn't appear to be using tagged
released, treat this as a git tree and check the updates appropriately.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/fvp/execstack-native.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-devtools/fvp/execstack-native.bb b/meta-arm=
/recipes-devtools/fvp/execstack-native.bb
index 055d39ed0646..8f22d8bab657 100644
--- a/meta-arm/recipes-devtools/fvp/execstack-native.bb
+++ b/meta-arm/recipes-devtools/fvp/execstack-native.bb
@@ -8,6 +8,10 @@ SRC_URI =3D "git://git.yoctoproject.org/prelink-cross;pr=
otocol=3Dhttps;branch=3Dmaster
 SRCREV =3D "ff2561c02ade96c5d4d56ddd4e27ff064840a176"
 PV =3D "1.0+git${SRCPV}"
=20
+# The last tagged release was 20151030.  Track this as a git tree to
+# see if there are any updates
+UPSTREAM_CHECK_COMMITS =3D "1"
+
 S =3D "${WORKDIR}/git"
=20
 inherit autotools native
--=20
2.39.5 (Apple Git-154)


