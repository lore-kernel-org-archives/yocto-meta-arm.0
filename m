Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C19C3601C
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 13:09:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18689.1743512955103777135
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 06:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 176D714BF
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Apr 2025 06:09:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F5BC3F694
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Apr 2025 06:09:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] CI: disable KAS_REPO_REF_DIR by default
Date: Tue,  1 Apr 2025 14:09:08 +0100
Message-ID: <20250401130909.2924629-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401130909.2924629-1-ross.burton@arm.com>
References: <20250401130909.2924629-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Apr 2025 13:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6428

Having local repo caches is a little fiddly to manage, and by definition
we're running CI inside GitLab which supports mirroring repositories
automatically.

As these mirrors are always available and update automatically, make
Kas reference directories opt-in and instead expect that the site is
either fine with full fetches, or is using KAS_PREMIRRORS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2337f957..2575807e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -36,7 +36,8 @@ stages:
     KUBERNETES_CPU_REQUEST: $CPU_REQUEST
     KAS_WORK_DIR: $CI_PROJECT_DIR/work
     KAS_BUILD_DIR: $KAS_WORK_DIR/build
-    KAS_REPO_REF_DIR: $CACHE_DIR/repos
+    # Set this in the environment to enable local repository caches
+    KAS_REPO_REF_DIR: ""
     SSTATE_DIR: $CACHE_DIR/sstate
     DL_DIR: $CACHE_DIR/downloads
     BB_LOGCONFIG: $CI_PROJECT_DIR/ci/logging.yml
--=20
2.43.0


