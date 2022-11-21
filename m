Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399D1C43217
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41981.1669045438991451140
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 07:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C5801477;
	Mon, 21 Nov 2022 07:44:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE5E03F73B;
	Mon, 21 Nov 2022 07:43:57 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Adrian Herrera <adrian.herrera@arm.com>
Subject: [PATCH 3/7] atp: move m5readfile to meta-gem5
Date: Mon, 21 Nov 2022 10:43:48 -0500
Message-Id: <20221121154352.5061-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221121154352.5061-1-jon.mason@arm.com>
References: <20221121154352.5061-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 15:44:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4146

From: Adrian Herrera <adrian.herrera@arm.com>

The m5 readfile recipe provides general utility for gem5 users to
run any script on OS boot. We hence move it to the meta-gem5 layer.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
---
 {meta-atp => meta-gem5}/recipes-devtools/gem5/gem5-m5readfile.bb  | 0
 .../recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh          | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-atp => meta-gem5}/recipes-devtools/gem5/gem5-m5readfile.bb (100%)
 rename {meta-atp => meta-gem5}/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh (100%)

diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5readfile.bb b/meta-gem5/recipes-devtools/gem5/gem5-m5readfile.bb
similarity index 100%
rename from meta-atp/recipes-devtools/gem5/gem5-m5readfile.bb
rename to meta-gem5/recipes-devtools/gem5/gem5-m5readfile.bb
diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh b/meta-gem5/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
similarity index 100%
rename from meta-atp/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
rename to meta-gem5/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
-- 
2.17.1


