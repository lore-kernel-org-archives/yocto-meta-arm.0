Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6237BC61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 17:53:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.145484.1700848438662835324
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Nov 2023 09:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9A711042;
	Fri, 24 Nov 2023 09:54:43 -0800 (PST)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.35.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F2EE3F73F;
	Fri, 24 Nov 2023 09:53:56 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/1] arm-bsp/documentation: corstone1000: fix the requirements.txt and conf.py path
Date: Fri, 24 Nov 2023 17:53:42 +0000
Message-Id: <20231124175342.111759-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231124175342.111759-1-emekcan.aras@arm.com>
References: <20231124175342.111759-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Nov 2023 17:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5282

From: Emekcan Aras <Emekcan.Aras@arm.com>

Readthedocs server requires an absolute path from project's root
directory to find correct requirements.txt and conf.py.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/documentation/corstone1000/.readthedocs.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/.readthedocs.yaml b/=
meta-arm-bsp/documentation/corstone1000/.readthedocs.yaml
index 1d13f824..1b07ce81 100644
--- a/meta-arm-bsp/documentation/corstone1000/.readthedocs.yaml
+++ b/meta-arm-bsp/documentation/corstone1000/.readthedocs.yaml
@@ -4,9 +4,9 @@ build:
   tools:
     python: "3.9"
 sphinx:
-  configuration: conf.py
+  configuration: meta-arm-bsp/documentation/corstone1000/conf.py
 formats:
   - pdf
 python:
   install:
-    - requirements: ../requirements.txt
+    - requirements: meta-arm-bsp/documentation/requirements.txt
--=20
2.25.1


