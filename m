Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7137CCDE016
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:14:27 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.web10.46170.1727363658567489796
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4XDxvr4DQ3zFPC;
	Thu, 26 Sep 2024 17:14:16 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4XDxvr1R5pzGbS;
	Thu, 26 Sep 2024 17:14:16 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 26 Sep 2024 17:14:07 +0200
Subject: [PATCH] add basic b4 config file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-b4-v1-1-5c1002121c32@cherry.de>
X-B4-Tracking: v=1; b=H4sIAD969WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyMz3SQT3SSzpNS0tGRDIzPjJCWgwoKi1LTMCrAh0bG1tQCzP9aZVAA
 AAA==
To: meta-arm@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.0
X-Infomaniak-Routing: alpha
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 15:14:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6116

From: Quentin Schulz <quentin.schulz@cherry.de>

b4[1] is a very nice tool for mail-based contribution. A config[2] file
exists to set up a few defaults. We can use it to set the To recipients
to always add, in our case the mailing list.

This shouldn't be necessary if we had a script that b4 prep --auto-to-cc
could call to find the mail address(es) to send to. Let's start without
it for now.

[1] https://pypi.org/project/b4/
[2] https://b4.docs.kernel.org/en/latest/config.html

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Support b4 for easier contribution workflow.

Note that this should be backportable as is to earlier releases.

Additionally, we may want to add:

send-prefixes = <insert release name>

in earlier release branches so that one doesn't even have to think about
adding the branch name when writing patches for older releases (added
bonus is that the maintainers would then know if someone has sent
patches developed on earlier releases instead of targeting master :) ).
---
 .b4-config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 00000000..752ca4b2
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,2 @@
+[b4]
+	send-series-to = meta-arm@lists.yoctoproject.org

---
base-commit: ea2c1ab5db4e2bd9ad0e93534f62391c86417a0c
change-id: 20240926-b4-b6beffc1263b

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


