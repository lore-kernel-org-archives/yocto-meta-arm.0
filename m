Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936D6C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 09:56:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5313.1646387787343129244
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 01:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC8F31424;
	Fri,  4 Mar 2022 01:56:26 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.90.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12E5A3F66F;
	Fri,  4 Mar 2022 01:56:25 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH honister 3/3] arm-bsp/docs: Add -b honister instruction for
 fvp-baser-aemv8r64
Date: Fri,  4 Mar 2022 09:56:11 +0000
Message-Id: <20220304095611.217114-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304095611.217114-1-peter.hoyes@arm.com>
References: <20220304095611.217114-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 09:56:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3111

From: Peter Hoyes <Peter.Hoyes@arm.com>

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I1874b0bd9dc5e3da9c40b46d9d002b83b41addcc
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 6fc7152..b137776 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -135,7 +135,7 @@ Fetch the meta-arm repository into a build directory:
=20
     mkdir -p ~/fvp-baser-aemv8r64-build
     cd ~/fvp-baser-aemv8r64-build
-    git clone https://git.yoctoproject.org/git/meta-arm
+    git clone https://git.yoctoproject.org/git/meta-arm -b honister
=20
=20
 ### Build
--=20
2.25.1


