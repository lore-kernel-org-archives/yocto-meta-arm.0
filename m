Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233BEC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 19:18:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.736.1643397523174775199
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 11:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0A47113E
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Jan 2022 11:18:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8ED3F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Jan 2022 11:18:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][gatesgarth] CI: pin Kas container to 2.6.3
Date: Fri, 28 Jan 2022 19:18:40 +0000
Message-Id: <20220128191840.2767463-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Jan 2022 19:18:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2928

Pin the Kas container to the 2.6.3 release, using debian-10, as newer
images use debian-11 which isn't a supported host distribution for
Gatesgarth.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a2cd68d8..4d6e8344 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,5 @@
-image: ghcr.io/siemens/kas/kas
+# We need 2.6.3 as this is the latest container with an old enough distr=
o
+image: ghcr.io/siemens/kas/kas:2.6.3
=20
   # First do a common bootstrap, and then build all the targets
 stages:
--=20
2.25.1


