Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DC7C43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:14:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45692.1658261642381415006
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 809551576;
	Tue, 19 Jul 2022 13:14:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8640E3F766;
	Tue, 19 Jul 2022 13:14:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 9/9] arm/trusted-services: ignore buildpath warnings
Date: Tue, 19 Jul 2022 21:13:53 +0100
Message-Id: <20220719201353.1467716-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719201353.1467716-1-ross.burton@arm.com>
References: <20220719201353.1467716-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3582

Latest oe-core has enabled the buildpaths QA check, which warns if the
build paths are present inside binaries. This is because build paths in
deployed binaries is both information leakage and non-reproducible.

Until this is fixed, skip this check.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/trusted-services/ts-corstone1000.inc     | 2 +-
 .../trusted-services/secure-partitions_git.bb                 | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index e14730e3..fe5de58a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -121,6 +121,6 @@ do_install:append() {
 }
=20
 FILES:${PN}-dev =3D "${includedir}/deployments/psa-api-test/"
-INSANE_SKIP:${PN}-psa-api-tests +=3D "rpaths dev-so"
+INSANE_SKIP:${PN}-psa-api-tests +=3D "rpaths dev-so buildpaths"
 PACKAGES +=3D "${PN}-psa-api-tests"
 FILES:${PN}-psa-api-tests =3D "${libdir} ${bindir}"
diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions=
_git.bb b/meta-arm/recipes-security/trusted-services/secure-partitions_gi=
t.bb
index cfbae78a..fca6d9d3 100644
--- a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
@@ -68,3 +68,7 @@ do_deploy() {
 addtask deploy after do_install
=20
 FILES:${PN} =3D "/firmware/sp/opteesp*"
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN} +=3D "buildpaths"
+INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
--=20
2.34.1


