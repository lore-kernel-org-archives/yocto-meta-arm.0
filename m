Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8A2C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 13:07:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6960.1665493634641840625
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Oct 2022 06:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04EDC1042;
	Tue, 11 Oct 2022 06:07:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 542B53F792;
	Tue, 11 Oct 2022 06:07:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: restrict compression threading
Date: Tue, 11 Oct 2022 14:07:10 +0100
Message-Id: <20221011130710.1638676-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Oct 2022 13:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3948

On large systems, using all of the CPUs and 50% of the RAM when xz
compressing packages is actively harmful because it will happily use up
to that limit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ci/base.yml b/ci/base.yml
index 3f644c1e..3619b8f2 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -30,6 +30,9 @@ local_conf_header:
     CONF_VERSION =3D "2"
     BB_NUMBER_THREADS =3D "16"
     PARALLEL_MAKE =3D "-j16"
+    XZ_MEMLIMIT =3D "25%"
+    XZ_THREADS =3D "16"
+    ZSTD_THREADS =3D "16"
     LICENSE_FLAGS_ACCEPTED +=3D "Arm-FVP-EULA"
   setup: |
     PACKAGE_CLASSES =3D "package_ipk"
--=20
2.34.1


