Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1950.1627459155295370157
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Jul 2021 00:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 992521FB;
	Wed, 28 Jul 2021 00:59:04 -0700 (PDT)
Received: from e126543.arm.com (unknown [10.57.9.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD6E23F73D;
	Wed, 28 Jul 2021 00:59:03 -0700 (PDT)
From: "Hugo L'Hostis" <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-bsp/fvp-baser-aemv8r64: Use master as kas default refspec
Date: Wed, 28 Jul 2021 08:58:53 +0100
Message-Id: <20210728075854.1210038-1-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

the default refspec for the repos used by kas is now master.

Issue-Id: SCM-2953
Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I9a68ca36f107e0b72c97b7a402829fec850d8acc
---
 kas/fvp-baser-aemv8r64-bsp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index b08e1a9..bb1e473 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -6,7 +6,7 @@ machine: fvp-baser-aemv8r64
=20
 defaults:
   repos:
-    refspec: hardknott
+    refspec: master
=20
 repos:
   meta-arm:
--=20
2.25.1

