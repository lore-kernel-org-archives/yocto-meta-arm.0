Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1283.1617122607296617818
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 09:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9397EED1
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 09:43:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 394B83F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 09:43:26 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: move utility tasks to prep so they don't cause a fetch
Date: Tue, 30 Mar 2021 17:43:23 +0100
Message-Id: <20210330164323.2552821-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330164323.2552821-1-ross.burton@arm.com>
References: <20210330164323.2552821-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Re-order the tasks so that the utility tasks don't cause update-repos to
run.

Change-Id: I86a528c98fe32e20428f9efbd5fb82c374aefc8a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index faf655d..22ffb12 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -150,7 +150,7 @@ tc0:
 # Report on disk usage
 usage:
   extends: .setup
-  stage: bootstrap
+  stage: prep
   when: manual
   script:
   - du -h -s $DL_DIR $SSTATE_DIR
@@ -158,7 +158,7 @@ usage:
 # Wipe out old sstate
 prune-sstate:
   extends: .setup
-  stage: bootstrap
+  stage: prep
   when: manual
   script:
   - find $SSTATE_DIR -type f -atime +30 -delete
@@ -166,7 +166,7 @@ prune-sstate:
 # Delete all sstate
 delete-sstate:
   extends: .setup
-  stage: bootstrap
+  stage: prep
   when: manual
   script:
   - rm -rf $SSTATE_DIR/*
--=20
2.25.1

