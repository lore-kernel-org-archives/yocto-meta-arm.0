Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17797C7EE29
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:43:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.260.1686062597968460790
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 07:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DFAC2F4;
	Tue,  6 Jun 2023 07:44:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22B513F6C4;
	Tue,  6 Jun 2023 07:43:17 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] kas: remove obsolete armcompiler LICENSE_FLAGS_ACCEPTED
Date: Tue,  6 Jun 2023 15:43:14 +0100
Message-Id: <20230606144315.3928160-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 14:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4737

From: Ross Burton <ross.burton@arm.com>

armcompiler was removed from meta-arm-toolchain (24c4cfa) so this isn't
needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 kas/corstone1000-base.yml | 1 -
 kas/corstone500.yml       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 6fda343b..9cfe1a20 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -31,7 +31,6 @@ local_conf_header:
   base: |
     CONF_VERSION =3D "2"
     PACKAGE_CLASSES =3D "package_ipk"
-    LICENSE_FLAGS_ACCEPTED +=3D "armcompiler"
     BB_NUMBER_THREADS ?=3D "16"
     PARALLEL_MAKE ?=3D "-j16"
     PACKAGECONFIG:append:pn-perf =3D " coresight"
diff --git a/kas/corstone500.yml b/kas/corstone500.yml
index a454a469..f1587b44 100644
--- a/kas/corstone500.yml
+++ b/kas/corstone500.yml
@@ -33,7 +33,6 @@ local_conf_header:
   base: |
     CONF_VERSION =3D "2"
     PACKAGE_CLASSES =3D "package_ipk"
-    LICENSE_FLAGS_ACCEPTED +=3D "armcompiler"
     BB_NUMBER_THREADS ?=3D "16"
     PARALLEL_MAKE ?=3D "-j16"
     PACKAGECONFIG:append:pn-perf =3D " coresight"
--=20
2.34.1


