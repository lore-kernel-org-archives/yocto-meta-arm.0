Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EAEC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:48:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16341.1676908123755184370
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 07:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 367AF15BF;
	Mon, 20 Feb 2023 07:49:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D75523F703;
	Mon, 20 Feb 2023 07:48:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-toolchain/gcc-arm: add missing Signed-off-by tag
Date: Mon, 20 Feb 2023 15:48:40 +0000
Message-Id: <20230220154841.43053-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Feb 2023 15:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4424

---
 .../gcc/gcc-arm-12.2/0026-rust-recursion-limit.patch             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0026-ru=
st-recursion-limit.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-ar=
m-12.2/0026-rust-recursion-limit.patch
index bbe2f18f..e13a9962 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0026-rust-recu=
rsion-limit.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0026-rust-recu=
rsion-limit.patch
@@ -9,6 +9,7 @@ libiberty/
 	* rust-demangle.c (demangle_const): Add recursion limit.
=20
 Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D9234cdca6ee88badfc00297e72f13dac4e540c79]
+Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
 ---
  libiberty/rust-demangle.c | 29 ++++++++++++++++++++---------
  1 file changed, 20 insertions(+), 9 deletions(-)
--=20
2.34.1


