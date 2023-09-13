Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D1FEDEC54
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:04:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12833.1694613890903746009
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 07:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 222B71FB;
	Wed, 13 Sep 2023 07:05:27 -0700 (PDT)
Received: from e125920.cambridge.arm.com (e125920.cambridge.arm.com [10.1.199.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234843F738;
	Wed, 13 Sep 2023 07:04:49 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/2] CI: Allow a GitHub container registry mirror to be specified
Date: Wed, 13 Sep 2023 15:03:41 +0100
Message-Id: <20230913140342.452683-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Sep 2023 14:04:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5045

From: Peter Hoyes <Peter.Hoyes@arm.com>

To make the pipeline slightly more resilient to external networking
issues, allow a local container registry mirror to be specified in the
GitLab settings. If not specified, the upstream container registry is
used automatically.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a2af8716..06fba597 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,9 +1,10 @@
-image: ghcr.io/siemens/kas/kas:3.3
+image: ${MIRROR_GHCR}/siemens/kas/kas:3.3
=20
 variables:
   CPU_REQUEST: ""
   DEFAULT_TAG: ""
   CACHE_DIR: $CI_BUILDS_DIR/persist
+  MIRROR_GHCR: ghcr.io
   # These are needed as the k8s executor doesn't respect the container e=
ntrypoint
   # by default
   FF_KUBERNETES_HONOR_ENTRYPOINT: 1
--=20
2.34.1


