Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEC7C27C5F
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:09:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3230.1717524592507024263
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 11:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22EF5DA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:10:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7ED6A3F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:09:52 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm/arm-tstee: add UPSTREAM_CHECK
Date: Tue,  4 Jun 2024 14:09:49 -0400
Message-Id: <20240604180949.15501-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240604180949.15501-1-jon.mason@arm.com>
References: <20240604180949.15501-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 18:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5790

Add UPSTREAM_CHECK_GITTAGREGEX to allow devtool to check for the latest
version

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb b/meta-=
arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
index 44608b1dd263..34beac945ffa 100644
--- a/meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
+++ b/meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
@@ -12,6 +12,7 @@ S =3D "${WORKDIR}/git"
=20
 # Tag tee-v2.0.0
 SRCREV =3D "a2d7349a96c3b3afb44bf1555d53f1c46e45a23d"
+UPSTREAM_CHECK_GITTAGREGEX =3D "^tee-v(?P<pver>\d+(\.\d+)+)$"
=20
 COMPATIBLE_HOST =3D "(arm|aarch64).*-linux"
 KERNEL_MODULE_AUTOLOAD +=3D "arm-tstee"
--=20
2.39.3 (Apple Git-146)


