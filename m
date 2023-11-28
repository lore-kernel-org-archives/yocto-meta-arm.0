Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B732BC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 00:35:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.806.1701131749573258560
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 16:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9E212F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Nov 2023 16:36:35 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F3A03F6C4
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Nov 2023 16:35:47 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH dunfell] arm/linux-arm64-ack: update branch name
Date: Mon, 27 Nov 2023 18:35:42 -0600
Message-Id: <20231128003542.9703-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Nov 2023 00:35:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5283

The "deprecated" string was added to the branch name, which was causing
the SHA not to be found.  Update to the new name.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb b/meta=
-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
index 99db9605..e0cc0678 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
@@ -16,7 +16,7 @@ COMPATIBLE_MACHINE ?=3D "invalid"
 ARCH =3D "arm64"
=20
 SRC_URI =3D " \
-    git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;br=
anch=3Dandroid-4.19-q-release \
+    git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;br=
anch=3Ddeprecated/android-4.19-q-release \
     "
=20
 # ASB-2020-06-05_4.19-q-release tag commit
--=20
2.30.2


