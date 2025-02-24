Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5710AC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 14:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.91015.1740408673415443492
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 06:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA6651756
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 06:51:29 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 021D33F6A8
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 06:51:12 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-a: update git recipe
Date: Mon, 24 Feb 2025 09:51:11 -0500
Message-Id: <20250224145112.71746-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250224145112.71746-1-jon.mason@arm.com>
References: <20250224145112.71746-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 14:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6379

Update the TF-A git recipe to the latest commit (as it was older than
the 2.12 release previously).  Also, update mbedtls to 3.6.2 (per the
tf-a docs in the master branch).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_git.bb            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 91e0f86d2d38..62a5927e8fb4 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -1,15 +1,15 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
 # TF-A master
-SRCREV_tfa =3D "bcce173da397f776fc0ec14e9dac03c13ddeb722"
+SRCREV_tfa =3D "0035ab76e580b59f88ad5a6be76b7f2bebbac654"
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.1
+# mbedtls-3.6.2
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-3.6"
-SRCREV_mbedtls =3D "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
+SRCREV_mbedtls =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
--=20
2.39.5 (Apple Git-154)


