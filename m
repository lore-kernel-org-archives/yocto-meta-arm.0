Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15328C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 16:04:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16065.1634054673346380257
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 09:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 134A41FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Oct 2021 09:04:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30CF3F66F
	for <meta-arm@lists.yoctoproject.org>; Tue, 12 Oct 2021 09:04:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: build against Honister until release
Date: Tue, 12 Oct 2021 17:04:16 +0100
Message-Id: <20211012160416.994122-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Oct 2021 16:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2268

oe-core has branched Honister off and master is taking breaking changes.
As we're still stabilising for release, we should pin to the honister
branches where possible.

Change-Id: Icb05bee45dcc88ca9cbac72b7c18cbaeb89a7491
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml        | 2 +-
 ci/clang.yml       | 1 +
 ci/meta-zephyr.yml | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index d2ea867a..2c41232e 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    refspec: master
+    refspec: honister
=20
 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index f3524473..063f72d9 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
+    refspec: master
=20
 local_conf_header:
   clang: |
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index 2b9d19e5..d8fae2ef 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -6,3 +6,4 @@ header:
 repos:
   meta-zephyr:
     url: https://git.yoctoproject.org/git/meta-zephyr
+    refspec: master
--=20
2.25.1


