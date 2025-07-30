Return-Path: <csaba.szilagyi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478D4C87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:47:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29943.1753861654206293066
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: csaba.szilagyi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B811C25;
	Wed, 30 Jul 2025 00:47:25 -0700 (PDT)
Received: from ubuntu-build.budapest.arm.com (GM0ZH93R.arm.com [10.45.26.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4803F673;
	Wed, 30 Jul 2025 00:47:32 -0700 (PDT)
From: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Csaba=20Szil=C3=A1gyi?= <csaba.szilagyi@arm.com>
Subject: [PATCH 1/6] Revert "arm/hafnium: refuse to build on non-x86-64 hosts"
Date: Wed, 30 Jul 2025 07:45:46 +0000
Message-ID: <20250730074551.1388-2-csaba.szilagyi@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074551.1388-1-csaba.szilagyi@arm.com>
References: <20250730074551.1388-1-csaba.szilagyi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 07:47:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6628

According to original commit, clang for other targets
like aarch64 were not available. This condition is not
present anymore therefore check for x86_64 can be removed.

This reverts commit 01a13b11ad25aaeebf861bc30029282709216fe0.

Signed-off-by: Csaba Szil=C3=A1gyi <csaba.szilagyi@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index d4bf501f..6bf6d8e9 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -68,10 +68,4 @@ do_deploy() {
 }
 addtask deploy after do_install
=20
-python() {
-    # https://developer.trustedfirmware.org/T898
-    if d.getVar("BUILD_ARCH") !=3D "x86_64":
-        raise bb.parse.SkipRecipe("Cannot be built on non-x86-64 hosts")
-}
-
 EXCLUDE_FROM_WORLD =3D "1"

