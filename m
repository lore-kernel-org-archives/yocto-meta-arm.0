Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38146CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:03:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12992.1757495032013991607
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 02:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A56B16F8
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 02:03:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1B333F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 02:03:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI: no need to configure coresight explicitly
Date: Wed, 10 Sep 2025 10:03:44 +0100
Message-ID: <20250910090346.1623394-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 09:03:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6692

The oe-core perf recipe will now enable coresight support automatically
if the coresight MACHINE_FEATURE is set[1], so we can remove the manual
configuration in our CI and let the machines enable it where appropriate.

[1] oe-core c455bd03910 ("perf: enable coresight if enabled in MACHINE_FE=
ATURES")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 86c924f70e..d89533901c 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -30,11 +30,9 @@ local_conf_header:
   base: |
     CONF_VERSION =3D "2"
     BB_SERVER_TIMEOUT =3D "300"
-  setup: |
-    PACKAGECONFIG:append:pn-perf =3D " coresight"
     INHERIT +=3D "rm_work"
   extrapackages: |
-    CORE_IMAGE_EXTRA_INSTALL +=3D "perf opencsd"
+    CORE_IMAGE_EXTRA_INSTALL +=3D "perf"
     CORE_IMAGE_EXTRA_INSTALL:append:aarch64 =3D " gator-daemon"
=20
 machine: unset
--=20
2.43.0


