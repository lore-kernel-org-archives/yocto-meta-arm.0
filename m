Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C77CC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 13:38:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11277.1642426709755570348
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 05:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B36BC1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 05:38:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50BB63F774
	for <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 05:38:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: track honister branch for clang and zephyr
Date: Mon, 17 Jan 2022 13:38:24 +0000
Message-Id: <20220117133824.465198-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 13:38:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2835

These layers now have honister branches, so track those instead of master=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml       | 1 -
 ci/meta-zephyr.yml | 1 -
 2 files changed, 2 deletions(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index 063f72d9..f3524473 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    refspec: master
=20
 local_conf_header:
   clang: |
diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index d8fae2ef..2b9d19e5 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -6,4 +6,3 @@ header:
 repos:
   meta-zephyr:
     url: https://git.yoctoproject.org/git/meta-zephyr
-    refspec: master
--=20
2.25.1


