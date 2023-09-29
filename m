Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458DDE71D4F
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20400.1696000893850020384
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D36B11007;
	Fri, 29 Sep 2023 08:22:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 018D03F5A1;
	Fri, 29 Sep 2023 08:21:32 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 03/10] arm/trusted-services: add missing pkgconfig inherit
Date: Fri, 29 Sep 2023 16:21:21 +0100
Message-Id: <20230929152128.3401009-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5083

From: Ross Burton <ross.burton@arm.com>

The configure log warns that it couldn't find pkgconfig, so add this so
it can.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/trusted-services/trusted-services.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index c64a1d41..b46cd498 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://trusted-services.readthedocs.io/en/=
latest/index.html"
=20
 LICENSE =3D "Apache-2.0 & BSD-3-Clause & Zlib"
=20
-inherit python3native cmake
+inherit python3native cmake pkgconfig
=20
 COMPATIBLE_HOST =3D "aarch64.*-linux"
 COMPATIBLE_MACHINE ?=3D "invalid"
--=20
2.34.1


