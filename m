Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC97105F7A6
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 13:21:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15683.1773408066433791365
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 06:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB673176A
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Mar 2026 06:20:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 837403F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Mar 2026 06:21:05 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: allow hashserver to be specified in environment
Date: Fri, 13 Mar 2026 13:21:00 +0000
Message-ID: <20260313132100.1603643-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313132100.1603643-1-ross.burton@arm.com>
References: <20260313132100.1603643-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Mar 2026 13:21:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6953

If the sstate is being mounted into the container then the hashserver
also needs to be shared, and not stored inside the build tree. Mark
BB_HASHSERVE as being set via an environment variable so the GitLab
runner environment can set the correct location.

This fixes a long-standing problem causing substandard reuse, which now
is detected and causes a warning in oe-core[1].

[1] oe-core 491de0db64a ("sanity.bbclass: warn when sstate is outside of
    build dir, but hash equiv database is inside it")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/base.yml b/ci/base.yml
index cb1fe91439..75e87a841c 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -33,6 +33,7 @@ repos:
=20
 env:
   BB_LOGCONFIG: ""
+  BB_HASHSERVE: "auto"
=20
 local_conf_header:
   base: |
--=20
2.43.0


