Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2456.1792436649266752934
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 12:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EQi7fMBi;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FA6220E3
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2026 12:04:05 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DFA43F7B4
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2026 12:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792436648; bh=rd2V6oAWNXjeomrN9psAdFLhDF5mMe/f+B9FCn639cE=;
	h=From:To:Subject:Date:From;
	b=EQi7fMBiXzJduXbQR2wFMvRwQqkmXsVqWJil/6YcypDZ+935PNwmwloZnoip++3EQ
	 SuSVylArMl0FGPq8rA0ZjTrP7EmVON8DyOFMHKwsppE36/Mg7Ywe6EYLqHLWduvJjg
	 x63FsBoGgRbRXEVdXbnR57znfXSYDl3TW5PbkQZc=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update to kas 5.5
Date: Mon, 19 Oct 2026 15:04:06 -0400
Message-ID: <20261019190406.41465-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2026 19:04:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7191
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9279ef56ac57..b6ee135330a8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ${MIRROR_GHCR}/siemens/kas/kas:5.2
+image: ${MIRROR_GHCR}/siemens/kas/kas:5.5
=20
 variables:
   # These are needed as the k8s executor doesn't respect the container
--=20
2.54.0 (Apple Git-157)

