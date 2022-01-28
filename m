Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9C7C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 19:18:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.731.1643397496216748125
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 11:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3CA2113E
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Jan 2022 11:18:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9672E3F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Jan 2022 11:18:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][honister] CI: use the latest release of the Kas container
Date: Fri, 28 Jan 2022 19:18:11 +0000
Message-Id: <20220128191811.2767282-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Jan 2022 19:18:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2926

If we don't specify a tag name GitLab uses the 'latest' tag, which for
Kas is moved whenever an image build is made.

Instead explicitly use the latest-release tag, which is only updated
when a release is made.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b52ef9ba..cd7bde33 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas
+image: ghcr.io/siemens/kas/kas:latest-release
=20
 stages:
   - prep
--=20
2.25.1


