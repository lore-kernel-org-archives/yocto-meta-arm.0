Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1379EC0015E
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 09:19:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54731.1688462341463402920
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jul 2023 02:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77DEE2F4;
	Tue,  4 Jul 2023 02:19:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99BC33F73F;
	Tue,  4 Jul 2023 02:19:00 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] CI: use branch, not refspec
Date: Tue,  4 Jul 2023 10:18:57 +0100
Message-Id: <20230704091857.3645929-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704091857.3645929-1-ross.burton@arm.com>
References: <20230704091857.3645929-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jul 2023 09:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4854

From: Ross Burton <ross.burton@arm.com>

Kas 3.3 uses branch and commit keys instead of a general-purpose
refspec. Change the base to use branch:mickledore and remove the
explicit use of master for meta-virtualization now that a mickledore
branch exists there too now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/base.yml                | 2 +-
 ci/meta-virtualization.yml | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 05142361..38d8584f 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    refspec: mickledore
+    branch: mickledore
=20
 repos:
   meta-arm:
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 5fba0481..88f8cdc9 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,4 +6,3 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
-    refspec: master
--=20
2.34.1


