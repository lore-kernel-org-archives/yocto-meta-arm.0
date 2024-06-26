Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0CCC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:43:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30410.1719416607999371087
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jun 2024 08:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61E89339
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jun 2024 08:43:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 292DF3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jun 2024 08:43:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update to Kas 4.4 image
Date: Wed, 26 Jun 2024 16:43:25 +0100
Message-Id: <20240626154325.2165430-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Jun 2024 15:43:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5843

The Kas 4.4 image includes the websocket module, needed to use the
public hashserv/sstate.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 506cb487..d085171e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ${MIRROR_GHCR}/siemens/kas/kas:4.3.2
+image: ${MIRROR_GHCR}/siemens/kas/kas:4.4
=20
 variables:
   # These are needed as the k8s executor doesn't respect the container
--=20
2.34.1


