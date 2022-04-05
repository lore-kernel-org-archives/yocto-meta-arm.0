Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53143C3527D
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6344.1649166494072361551
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AEEE1515
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Apr 2022 06:48:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDEF43F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Apr 2022 06:48:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-toolchain/tcmode-external-arm: skip gcc-cross-*
Date: Tue,  5 Apr 2022 14:48:10 +0100
Message-Id: <20220405134810.1999000-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405134810.1999000-1-ross.burton@arm.com>
References: <20220405134810.1999000-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3238

SKIP_RECIPE applies to the full recipe names, which are gcc-cross-[arch].

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index d413e3fa..178fb71e 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -22,6 +22,8 @@ IMAGE_LINGUAS:forcevariable =3D ""
 SKIP_RECIPE[glibc] =3D "Using external toolchain"
 SKIP_RECIPE[libgcc] =3D "Using external toolchain"
 SKIP_RECIPE[gcc-cross] =3D "Using external toolchain"
+SKIP_RECIPE[gcc-cross-aarch64] =3D "Using external toolchain"
+SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
 SKIP_RECIPE[gcc-runtime] =3D "Using external toolchain"
 SKIP_RECIPE[gcc-sanitizers] =3D "Using external toolchain"
=20
--=20
2.25.1


