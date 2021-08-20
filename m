Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.84071.1629465775552653817
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Aug 2021 06:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D05B11FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Aug 2021 06:22:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EA783F66F
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Aug 2021 06:22:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use the kas:next image
Date: Fri, 20 Aug 2021 14:22:45 +0100
Message-Id: <20210820132245.4125049-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

OpenEmbedded Core master now depends on a few more build tools, so use th=
e
kas:next image until these have been merged into kas:latest.

Change-Id: Ib4c36037d74ec6febca120346bd5bcb08acfccf6
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 697603b..96ea094 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas
+image: ghcr.io/siemens/kas/kas:next
=20
   # First do a common bootstrap, and then build all the targets
 stages:
--=20
2.32.0

