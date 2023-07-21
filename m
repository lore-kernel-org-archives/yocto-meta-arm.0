Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C4BC41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 14:18:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48837.1690208323994166165
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jul 2023 07:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B97241682
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jul 2023 07:19:26 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 752313F67D
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jul 2023 07:18:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: workaround 32bit timer warning in binary toolchain
Date: Thu, 20 Jul 2023 22:20:31 -0500
Message-Id: <20230721032031.3584730-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230721032031.3584730-1-jon.mason@arm.com>
References: <20230721032031.3584730-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jul 2023 14:18:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4916

Temporary workaround for a number binaries in the toolchains that are
using 32bit timer API.  This must be done in the CI yml file instead of
the recipe because of all the libraries in the toolchain have the issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/external-gccarm.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index fe8fa6ca..a3313d89 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -6,3 +6,6 @@ local_conf_header:
     SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
     TCMODE =3D "external-arm"
     EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/toolchains/${TARGET_ARCH}"
+    # Temporary workaround for a number binaries in the toolchains that =
are using 32bit timer API
+    # This must be done here instead of the recipe because of all the li=
braries in the toolchain have the issue
+    INSANE_SKIP:append =3D " 32bit-time"
--=20
2.30.2


