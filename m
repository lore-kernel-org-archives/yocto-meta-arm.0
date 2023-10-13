Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA15FCDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:52:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43947.1697215930511807940
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 09:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B38911FB;
	Fri, 13 Oct 2023 09:52:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABAFF3F5A1;
	Fri, 13 Oct 2023 09:52:09 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] CI: also run the _qemutiny testcase for poky-tiny
Date: Fri, 13 Oct 2023 17:52:05 +0100
Message-Id: <20231013165205.1678618-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013165205.1678618-1-ross.burton@arm.com>
References: <20231013165205.1678618-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 16:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5123

From: Ross Burton <ross.burton@arm.com>

The terribly named qemutiny test case tries to login to the target over
the serial console.  It's designed for poky-tiny, so add it to the tests
we run in poky-tiny builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/poky-tiny.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/poky-tiny.yml b/ci/poky-tiny.yml
index d869c557..f1763010 100644
--- a/ci/poky-tiny.yml
+++ b/ci/poky-tiny.yml
@@ -5,7 +5,7 @@ distro: poky-tiny
=20
 local_conf_header:
   hacking: |
-    TEST_SUITES =3D "ping"
+    TEST_SUITES =3D "_qemutiny ping"
   extrapackages: |
     # Intentionally blank to prevent perf from being added to the image =
in base.yml
=20
--=20
2.34.1


