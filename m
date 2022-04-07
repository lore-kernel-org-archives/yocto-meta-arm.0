Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BDFC4332F
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.360.1649347768508287689
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BBE01596
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDCDD3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] qemuarm64-secureboot: remove redundant UBOOT_MACHINE
Date: Thu,  7 Apr 2022 17:09:20 +0100
Message-Id: <20220407160925.3809765-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407160925.3809765-1-ross.burton@arm.com>
References: <20220407160925.3809765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3256

This is assigned in the base qemuarm64.conf already.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index b664dac8..99d92e07 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -4,8 +4,6 @@ require ${COREBASE}/meta/conf/machine/qemuarm64.conf
=20
 KMACHINE =3D "qemuarm64"
=20
-UBOOT_MACHINE =3D "qemu_arm64_defconfig"
-
 QB_MACHINE =3D "-machine virt,secure=3Don"
 QB_OPT_APPEND +=3D "-no-acpi"
 QB_MEM =3D "-m 1024"
--=20
2.25.1


