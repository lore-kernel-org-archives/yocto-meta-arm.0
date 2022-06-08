Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87669C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 09:16:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4375.1654679802278047815
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 02:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 478CB1424;
	Wed,  8 Jun 2022 02:16:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8222D3F66F;
	Wed,  8 Jun 2022 02:16:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] CI: upgrade external GCC to 11.2
Date: Wed,  8 Jun 2022 10:16:35 +0100
Message-Id: <20220608091637.109635-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 09:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3480

Our CI is now running on Broadwell+ cores, so the 11.2 release of GCC
should work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/get-binary-toolchains | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
index cd4c25ef..bfdd8c57 100755
--- a/ci/get-binary-toolchains
+++ b/ci/get-binary-toolchains
@@ -2,7 +2,7 @@
 set -u
=20
 HOST_ARCH=3D$(uname -m)
-VER=3D"10.3-2021.07"
+VER=3D"11.2-2022.02"
=20
 DOWNLOAD_DIR=3D$1
 TOOLCHAIN_DIR=3D$2
--=20
2.25.1


