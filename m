Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4773AC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:38:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.28401.1653316730975690487
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 07:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 329311595;
	Mon, 23 May 2022 07:38:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B87923F70D;
	Mon, 23 May 2022 07:38:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-toolchain/layer.conf: remove
 BB_DANGLINGAPPENDS_WARNONLY
Date: Mon, 23 May 2022 15:38:46 +0100
Message-Id: <20220523143846.2645047-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523143846.2645047-1-ross.burton@arm.com>
References: <20220523143846.2645047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 14:38:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3455

This appears to be historical from when the toolchain was in meta-linaro.

It isn't needed anymore, there's one bbappend in meta-arm-toolchain for
grub which is part of oe-core, so will never be dangling.

This variable has a global effect, so leaving it in here has a negative
impact on users.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-toolchain/conf/layer.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index 3512c345..dd54db82 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -11,8 +11,5 @@ BBFILE_PRIORITY_arm-toolchain =3D "5"
 LAYERDEPENDS_arm-toolchain =3D "core"
 LAYERSERIES_COMPAT_arm-toolchain =3D "kirkstone"
=20
-# do not error out on bbappends for missing recipes
-BB_DANGLINGAPPENDS_WARNONLY =3D "true"
-
 # These variables are used for armcompiler license
 BB_BASEHASH_IGNORE_VARS:append =3D " ARM_TOOL_VARIANT ARMLMD_LICENSE_FIL=
E LM_LICENSE_FILE"
--=20
2.25.1


