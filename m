Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5C9C43217
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 19:56:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15407.1633377378265485511
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Oct 2021 12:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F82B1FB
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAF0C3F70D
	for <meta-arm@lists.yoctoproject.org>; Mon,  4 Oct 2021 12:56:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 8/8] CI: build a proper TC0 image on x86-64
Date: Mon,  4 Oct 2021 20:56:12 +0100
Message-Id: <20211004195612.188487-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004195612.188487-1-ross.burton@arm.com>
References: <20211004195612.188487-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Oct 2021 19:56:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2248

Change-Id: Id3da3b6efd620c2052ef59dc731e4b159830e805
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 4 ++++
 ci/tc0.yml     | 4 ++++
 ci/tc1.yml     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f25dd410..48308c5d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -186,9 +186,13 @@ sgi575:
=20
 tc0:
   extends: .build
+  tags:
+    - x86_64
=20
 tc1:
   extends: .build
+  tags:
+    - x86_64
=20
 toolchains:
   extends: .build
diff --git a/ci/tc0.yml b/ci/tc0.yml
index 47f95af3..d8fccf7b 100644
--- a/ci/tc0.yml
+++ b/ci/tc0.yml
@@ -4,3 +4,7 @@ header:
     - base.yml
=20
 machine: tc0
+
+target:
+  - tc-artifacts-image
+  - perf
diff --git a/ci/tc1.yml b/ci/tc1.yml
index 137041d6..f4f1ad08 100644
--- a/ci/tc1.yml
+++ b/ci/tc1.yml
@@ -4,3 +4,7 @@ header:
     - base.yml
=20
 machine: tc1
+
+target:
+  - tc-artifacts-image
+  - perf
--=20
2.25.1


