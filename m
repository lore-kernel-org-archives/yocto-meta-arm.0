Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985A3C7EE32
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14155.1751032192461974232
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 06:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D51AA1007
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC3893F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 06:49:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][kirkstone 4/6] CI: don't run update-repos if KAS_REPO_REF_DIR isn't set
Date: Fri, 27 Jun 2025 14:49:44 +0100
Message-ID: <20250627134946.154438-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134946.154438-1-ross.burton@arm.com>
References: <20250627134946.154438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 13:49:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6588

Mostly taken from master.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2a07ea08be..ef75a45bba 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -76,8 +76,16 @@ update-repos:
   extends: .setup
   stage: prep
   script:
-    - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
+    - |
+      exit_code=3D0
=20
+      if [ -n "$KAS_REPO_REF_DIR" ]; then
+        flock --verbose --timeout 60 $KAS_REPO_REF_DIR --command ./ci/up=
date-repos || exit_code=3D$?
+        # Exit now if that failed, unless the status was 128 (fetch fail=
ed)
+        test $exit_code !=3D 0 -a $exit_code !=3D 128 && exit 1
+      fi
+
+      exit $exit_code
 #
 # Build stage, the actual build jobs
 #
--=20
2.43.0


