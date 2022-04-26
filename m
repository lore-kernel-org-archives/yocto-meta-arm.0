Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FABFC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5779.1650976451996179375
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99FE623A;
	Tue, 26 Apr 2022 05:34:11 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6A273F774;
	Tue, 26 Apr 2022 05:34:10 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH honister 0/9] arm-bsp/machine: Backport runfvp config for
 Corstone1000 and update runfvp script
Date: Tue, 26 Apr 2022 13:33:50 +0100
Message-Id: <20220426123359.22873-1-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3301

From: Harry Moulton <harry.moulton@arm.com>

These commits add the runfvp configuration for corstone1000 to Honister,
and patches for the runfvp script itself to fix issue with running cs1000.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>

Harry Moulton (1):
  arm-bsp/machine: Add runfvp config for corstone1000

Ross Burton (8):
  runfvp: add an asyncio TODO
  runfvp: handle the fvp quitting before we kill it
  runfvp: don't hide output when using terminals
  runfvp: don't use f-string when there's no expressions
  runfvp: refactor terminal selection
  runfvp: fix undefined variable in terminal selection login
  runfvp: propagate the exit code correctly
  runfvp: check for telnet

 ci/corstone1000-fvp.yml                       |  1 +
 kas/corstone1000-fvp.yml                      |  7 ++
 .../conf/machine/corstone1000-fvp.conf        | 34 ++++++-
 scripts/runfvp                                | 98 ++++++++++++++-----
 4 files changed, 115 insertions(+), 25 deletions(-)

-- 
2.17.1


