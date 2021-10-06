Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF8CC4332F
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 15:38:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13849.1633534703520974074
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 08:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F12F76D
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CDA23F66F
	for <meta-arm@lists.yoctoproject.org>; Wed,  6 Oct 2021 08:38:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/gn: don't statically link libstdc++
Date: Wed,  6 Oct 2021 16:38:18 +0100
Message-Id: <20211006153818.3948831-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006153818.3948831-1-ross.burton@arm.com>
References: <20211006153818.3948831-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Oct 2021 15:38:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2261

As we're building whole systems and not binaries that are expected to
be copied around, we can dynamically link to libstdc++.

Change-Id: I1e54ca519b069388226f40c489c9194b870a6d3c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 522a7efe..56002229 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -31,6 +31,7 @@ do_configure() {
     python3 ${S}/build/gen.py \
         --platform=3D${@gn_platform("TARGET_OS", d)} \
         --out-path=3D${B} \
+        --no-static-libstdc++ \
         --no-strip
 }
=20
--=20
2.25.1


