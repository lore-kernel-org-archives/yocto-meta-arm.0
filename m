Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B75C41513
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:46:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.215438.1697550416820676239
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 06:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFFDE2F4;
	Tue, 17 Oct 2023 06:47:36 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D3A93F5A1;
	Tue, 17 Oct 2023 06:46:55 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] Update Corstone-1000 doc with security issue reporting guideline
Date: Tue, 17 Oct 2023 14:46:48 +0100
Message-Id: <20231017134649.2865499-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5129

From: Xueliang Zhong <xueliang.zhong@arm.com>

Xueliang Zhong (1):
  Update Corstone-1000 doc with security issue reporting guideline

 meta-arm-bsp/documentation/corstone1000/user-guide.rst | 4 ++++
 1 file changed, 4 insertions(+)

--=20
2.25.1


