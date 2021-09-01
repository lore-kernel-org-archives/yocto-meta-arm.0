Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6564.1630496576621085902
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 04:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 330AB1042
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Sep 2021 04:42:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C61283F766
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Sep 2021 04:42:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: use the kas:next image"
Date: Wed,  1 Sep 2021 12:42:44 +0100
Message-Id: <20210901114244.3123861-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The kas:latest image now has the updated build dependencies, so use that
again instead of the potentially unstable next image.

This reverts commit 6b1d8abb3bdbd524ff9a9e34d671d17ee72d432e.

Change-Id: I28409bb176df91b7e8ebb558814b3d65dec78724
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 96ea0940..697603bb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas:next
+image: ghcr.io/siemens/kas/kas
=20
   # First do a common bootstrap, and then build all the targets
 stages:
--=20
2.25.1

