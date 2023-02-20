Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A55C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:48:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16577.1676908124300030811
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 07:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D65EFFEC;
	Mon, 20 Feb 2023 07:49:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8456C3F703;
	Mon, 20 Feb 2023 07:48:43 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm/optee-os: add missing patch header
Date: Mon, 20 Feb 2023 15:48:41 +0000
Message-Id: <20230220154841.43053-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220154841.43053-1-ross.burton@arm.com>
References: <20230220154841.43053-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Feb 2023 15:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4425

---
 .../0008-no-warn-rwx-segments.patch           | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn=
-rwx-segments.patch b/meta-arm/recipes-security/optee/optee-os-3.19.0/000=
8-no-warn-rwx-segments.patch
index 2dc797b3..64a3d7e5 100644
--- a/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-se=
gments.patch
+++ b/meta-arm/recipes-security/optee/optee-os-3.19.0/0008-no-warn-rwx-se=
gments.patch
@@ -1,3 +1,24 @@
+From cf2a2451f4e9300532d677bb3a8315494a3b3a82 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 5 Aug 2022 09:48:03 +0200
+Subject: [PATCH] core: link: add --no-warn-rwx-segments
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+binutils ld.bfd generates one RWX LOAD segment by merging several sectio=
ns
+with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 =
it
+also warns by default when that happens [1], which breaks the build due =
to
+--fatal-warnings. The RWX segment is not a problem for the TEE core, sin=
ce
+that information is not used to set memory permissions. Therefore, silen=
ce
+the warning.
+
+Link: [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
ba951afb99912da01a6e8434126b8fac7aa75107
+Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D29448
+Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
 diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
 index 0e96e606c..3fbcb6804 100644
 --- a/core/arch/arm/kernel/link.mk
--=20
2.34.1


