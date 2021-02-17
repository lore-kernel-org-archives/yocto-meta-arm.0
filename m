Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8784.1613574514730417232
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Feb 2021 07:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6A28ED1;
	Wed, 17 Feb 2021 07:08:33 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4907B3F694;
	Wed, 17 Feb 2021 07:08:33 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/documentation: Update multiconfig docs with mc name requirements
Date: Wed, 17 Feb 2021 15:08:20 +0000
Message-Id: <20210217150820.29079-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Update documentation to mention that hyphens are illegal in multiconfig
conf file names

Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I0c0c16063cc66f1d0d66b5458ee0eea5da4d2ee4
---
 meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
index 4f4bb74..8fd60f1 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
@@ -154,7 +154,9 @@ a different guestname.
 To have different config for each guest, each will need its own config
 file similar to guest.conf, ensuring TMPDIR is set to a different path,
 and everything between `---Guest Config Start---` and
-`---Guest Config End---` will need to be duplicated.
+`---Guest Config End---` will need to be duplicated. Ensure that the name
+of the multiconfig conf file does not contain any hyphens (-), since this
+will create errors when it becomes part of a function name.
 
 Any copies of variables that start `MC_GUEST` must be altered to avoid
 collisions (e.g. `MC_GUEST_2_*`), and the name of the conf file must also
-- 
2.17.1

