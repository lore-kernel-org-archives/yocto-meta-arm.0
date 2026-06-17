Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD7DCD98F5
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 12:43:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14467.1781700223362152193
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 05:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VX8hRehI;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 259CD4794
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 65BFE3F905
	for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781700222; bh=d21WMFqKwZsoxo5fIIwe+wA3pvTEwGGOLFy4BKcboLU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VX8hRehIF1jCAnCHyXLL06fan432F7Bt2aFoMiQ62lhrkKNvOzIhQ4zF6vYCk9Z8r
	 Tq4rJ9qVlbXa+TTx3L9HXKnS0QbftkiRCx2XyjkcJhKEimSqaYRgLQae8ORdEjjXuc
	 mIENu9Ae21vVtJWQPFFyDb6B7eJyNcGINUppqxWE=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] CI: add option to control whether warnings should be fatal or not
Date: Wed, 17 Jun 2026 13:43:33 +0100
Message-ID: <20260617124333.437665-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617124333.437665-1-ross.burton@arm.com>
References: <20260617124333.437665-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2026 12:43:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7084

Warnings being always fatal is quite anti-social because sometimes there
are temporary warnings that we don't want to break the CI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b285698f47..5059699ee5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -17,6 +17,8 @@ variables:
   MIRROR_GHCR: ghcr.io
   # The list of extra Kas fragments to be used when building
   EXTRA_KAS_FILES: ""
+  # Whether warnings should be fatal (0/1)
+  FATAL_WARNINGS: 0
=20
 stages:
   - prep
@@ -66,7 +68,9 @@ stages:
       echo KASFILES=3D$KASFILES
       kas dump --update --force-checkout --resolve-refs --resolve-env $K=
ASFILES
       kas build $KASFILES
-      ./ci/check-warnings $KAS_BUILD_DIR/warnings.log
+      if [ $FATAL_WARNINGS -ne 0 ]; then
+        ./ci/check-warnings $KAS_BUILD_DIR/warnings.log
+      fi
       kas shell ci/base.yml:lockfile.yml --command "$CI_PROJECT_DIR/ci/j=
unit.sh $KAS_WORK_DIR/build"
   artifacts:
     name: "logs"
--=20
2.43.0


