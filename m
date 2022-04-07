Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EC1C43217
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.403.1649347769006305065
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A25ED12FC
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FF573F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] qemuarm64-secureboot: disable the use of KVM
Date: Thu,  7 Apr 2022 17:09:21 +0100
Message-Id: <20220407160925.3809765-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407160925.3809765-1-ross.burton@arm.com>
References: <20220407160925.3809765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3257

When using -machine=3Dvirt,secure=3Don KVM cannot be used and will cause =
an
error, so forcibly disable the use of KVM.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index 99d92e07..22fb1d3e 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -4,6 +4,9 @@ require ${COREBASE}/meta/conf/machine/qemuarm64.conf
=20
 KMACHINE =3D "qemuarm64"
=20
+# secure=3Don can't ever use KVM, so force it off
+QEMU_USE_KVM =3D ""
+
 QB_MACHINE =3D "-machine virt,secure=3Don"
 QB_OPT_APPEND +=3D "-no-acpi"
 QB_MEM =3D "-m 1024"
--=20
2.25.1


