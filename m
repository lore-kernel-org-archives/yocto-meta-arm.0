Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57320E71D56
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20402.1696000894534549758
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883461FB;
	Fri, 29 Sep 2023 08:22:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAED93F5A1;
	Fri, 29 Sep 2023 08:21:33 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 04/10] arm/trusted-services/ts-remote-test: move binary to $bindir
Date: Fri, 29 Sep 2023 16:21:22 +0100
Message-Id: <20230929152128.3401009-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5084

From: Ross Burton <ross.burton@arm.com>

As with ts-service-test, manually move the binary to $bindir.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-services/ts-remote-test_git.bb                 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm/recipes-security/trusted-services/ts-remote-test_gi=
t.bb b/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb
index 203defea..1633ecfe 100644
--- a/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb
@@ -10,3 +10,10 @@ RDEPENDS:${PN} +=3D "libts"
 OECMAKE_SOURCEPATH =3D "${S}/deployments/ts-remote-test/${TS_ENV}"
=20
 FILES:${PN} =3D "${bindir}/ts-remote-test"
+
+do_install:append () {
+    install -d ${D}${bindir}
+    mv ${D}${TS_INSTALL}/bin/ts-remote-test ${D}${bindir}
+
+    rm -r --one-file-system ${D}${TS_INSTALL}
+}
--=20
2.34.1


