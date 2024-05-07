Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24574C25B74
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 17:33:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.315.1715103198306237103
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 May 2024 10:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECB57DA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:43 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 653E43F587
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 May 2024 10:33:17 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] CI: increase bitbake server timeout
Date: Tue,  7 May 2024 13:33:11 -0400
Message-Id: <20240507173313.50788-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240507173313.50788-1-jon.mason@arm.com>
References: <20240507173313.50788-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 May 2024 17:33:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5701

On some CI systems, the bitbake server is timing out at 1 mins.
Increase to 5 mins, which hopefully should give enough time without
letting it run forever.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/base.yml b/ci/base.yml
index 863159e171db..180d7c4cb0c8 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -33,6 +33,7 @@ env:
 local_conf_header:
   base: |
     CONF_VERSION =3D "2"
+    BB_SERVER_TIMEOUT =3D "300"
   setup: |
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
--=20
2.39.3 (Apple Git-146)


