Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E735C43219
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41983.1669045439315344659
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 07:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62E001FB;
	Mon, 21 Nov 2022 07:44:05 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6CBB3F73B;
	Mon, 21 Nov 2022 07:43:58 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Herrera=20Arcila?= <adrian.herrera@arm.com>
Subject: [PATCH 7/7] ci: add meta-atp to check-layers
Date: Mon, 21 Nov 2022 10:43:52 -0500
Message-Id: <20221121154352.5061-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221121154352.5061-1-jon.mason@arm.com>
References: <20221121154352.5061-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 15:44:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4149

From: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>

Signed-off-by: Adri=C3=A1n Herrera Arcila <adrian.herrera@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7d050a55..6bb42e85 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -210,7 +210,7 @@ check-layers:
       "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dep=
endency"
   parallel:
     matrix:
-      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
+      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5, m=
eta-atp]
=20
 pending-updates:
   extends: .setup
--=20
2.17.1


