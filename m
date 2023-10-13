Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE75C41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:52:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43946.1697215930335577581
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 09:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E45EF139F;
	Fri, 13 Oct 2023 09:52:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00EDD3F5A1;
	Fri, 13 Oct 2023 09:52:08 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] CI: don't hardcode the selftest tests to run
Date: Fri, 13 Oct 2023 17:52:04 +0100
Message-Id: <20231013165205.1678618-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013165205.1678618-1-ross.burton@arm.com>
References: <20231013165205.1678618-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 16:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5122

From: Ross Burton <ross.burton@arm.com>

Just execute all tests with the meta-arm tag, instead of hardcoding the
list of tests.

Also run two tests in parallel as there's no reason to limit it to one.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0466c096..e1845be5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -234,7 +234,7 @@ selftest:
   extends: .setup
   script:
     - KASFILES=3D./ci/qemuarm64.yml:./ci/selftest.yml:lockfile.yml
-    - kas shell --update --force-checkout $KASFILES -c 'oe-selftest --nu=
m-processes 1 --run-tests runfvp'
+    - kas shell --update --force-checkout $KASFILES -c 'oe-selftest --nu=
m-processes 2 --select-tag meta-arm --run-all-tests'
=20
 # Validate layers are Yocto Project Compatible
 check-layers:
--=20
2.34.1


