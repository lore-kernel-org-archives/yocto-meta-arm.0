Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B3BC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 12:31:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11413.1714566715311741322
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 May 2024 05:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 223672F4
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:32:21 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5AD83F73F
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:31:54 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/edk2-basetools: add UPSTREAM_CHECK logic
Date: Wed,  1 May 2024 08:31:51 -0400
Message-Id: <20240501123154.62576-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 12:31:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5680

Currently, 'devtool check-upgrade-status' returns UNKNOWN_BROKEN.  Add
regex to return the correct value.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
index bd840967314e..9a1086fc5b24 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202402.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520=
383f7964e96700ae12b4570a"
=20
 SRCREV =3D "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
=20
+UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
+
 S =3D "${WORKDIR}/git"
=20
 inherit native
--=20
2.39.3 (Apple Git-146)


