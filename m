Return-Path: <hugo.lhostis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A7EC433F5
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 12:50:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43.1633438202709213608
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 05:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugo.lhostis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C32EED6E;
	Tue,  5 Oct 2021 05:50:01 -0700 (PDT)
Received: from e126543.cambridge.arm.com (unknown [10.1.37.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB8633F70D;
	Tue,  5 Oct 2021 05:50:00 -0700 (PDT)
From: Hugo L'Hostis <hugo.lhostis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] kas/fvp-baser-aemv8r64: Use the HEAD of master for
 meta-arm and poky
Date: Tue,  5 Oct 2021 13:49:29 +0100
Message-Id: <20211005124930.3490492-2-hugo.lhostis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005124930.3490492-1-hugo.lhostis@arm.com>
References: <20211005124930.3490492-1-hugo.lhostis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Oct 2021 12:50:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2251

Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
Change-Id: I0db7d208146f22020ca56b5618b4c29cd19089a3
---
 kas/fvp-baser-aemv8r64-bsp.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index 33dd7a1..5a45575 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -12,7 +12,6 @@ repos:
   meta-arm:
     url: https://git.yoctoproject.org/git/meta-arm
     path: layers/meta-arm
-    refspec: ce6c4936e53ef9afb596baabafa893234d914c20
     layers:
       meta-arm:
       meta-arm-bsp:
@@ -21,7 +20,6 @@ repos:
   poky:
     url: https://git.yoctoproject.org/git/poky
     path: layers/poky
-    refspec: 1e2e9a84d6dd81d7f6dd69c0d119d0149d10ade1
     layers:
       meta:
       meta-poky:
--=20
2.25.1


