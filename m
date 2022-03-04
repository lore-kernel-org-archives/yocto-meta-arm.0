Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDBFC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 14:54:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7735.1646405675545112233
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 06:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F87F143D;
	Fri,  4 Mar 2022 06:54:34 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.90.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D963F73D;
	Fri,  4 Mar 2022 06:54:33 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/docs: Set required Kas version to 3.0 for
 fvp-baser-aemv8r64
Date: Fri,  4 Mar 2022 14:54:23 +0000
Message-Id: <20220304145423.523188-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 14:54:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3114

From: Peter Hoyes <Peter.Hoyes@arm.com>

poky master has changed a variable name to BB_ENV_PASSTHROUGH_ADDITIONS.
Support for this has been added in Kas 3.0

Issue-Id: SCM-3881
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ib42f79d144422272b2dd17fe0515da96909219eb
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index cbeb14b..c95e52e 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -98,7 +98,7 @@ Install the required packages for the build host:
 https://docs.yoctoproject.org/singleindex.html#required-packages-for-the=
-build-host
=20
 Kas is a setup tool for bitbake based projects. The minimal supported ve=
rsion
-is 2.6, install it like so:
+is 3.0, install it like so:
=20
     pip3 install --user kas
=20
--=20
2.25.1


