Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F194C6379F
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 16:34:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14781.1676565283846440271
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 08:34:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 301641042;
	Thu, 16 Feb 2023 08:35:26 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 014383F881;
	Thu, 16 Feb 2023 08:34:42 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] CI: Collect testimage logs on failure
Date: Thu, 16 Feb 2023 16:24:37 +0000
Message-Id: <20230216162437.1232175-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216162437.1232175-1-peter.hoyes@arm.com>
References: <20230216162437.1232175-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 16:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4411

From: Peter Hoyes <Peter.Hoyes@arm.com>

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6a286900..4471cf30 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -57,6 +57,7 @@ stages:
     when: on_failure
     paths:
       - $CI_PROJECT_DIR/work/build/tmp/work*/**/temp/log.do_*.*
+      - $CI_PROJECT_DIR/work/build/tmp/work*/**/testimage/*
=20
 #
 # Prep stage, update repositories once
--=20
2.34.1


