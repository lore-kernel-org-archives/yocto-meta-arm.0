Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25297C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 10:14:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40112.1785752060638055050
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Aug 2026 03:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=lpMkDu/r;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AD991476;
	Mon,  3 Aug 2026 03:14:16 -0700 (PDT)
Received: from e142474.cambridge.arm.com (e142474.arm.com [10.2.203.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99DC13F632;
	Mon,  3 Aug 2026 03:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752060; bh=UWRNNnQ5NnMQaWxJQhy3JN3WwPmwqwzQuD+wYAPXEeQ=;
	h=From:To:Cc:Subject:Date:From;
	b=lpMkDu/rpXxKnAdhzLjJfyhwuR/u0BgCCSbif2tkHSrNsa3QQb+vvfUZtcdRhq8hw
	 E4R7oaYqC8pNt2/esjuxNoBjBmfYRsiEzWGvyAa4vT6Y0j17BOj9Kj58+/QTks9KaR
	 r33H+OONOBV2OdrVq4cLQV4hbo4UedAUhRmTKjc8=
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 0/2] arm-bsp/docs: Improve Corstone1000 documentation
Date: Mon,  3 Aug 2026 11:13:59 +0100
Message-ID: <20260803101401.3496378-1-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Aug 2026 10:14:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7134

Simplify manual capsule generation by using a kas shell command.
Add armDS steps to Secure debug documentation.
Correct several related documentation issues.

Alex Chapman (2):
  arm-bsp/docs:corstone1000/a320: Use kas shell for capsule generation
  arm-bsp/docs:corstone1000: Clarify secure debug setup

 .../corstone1000-a320/topics/tests.md         | 138 +++----------
 .../documentation/corstone1000/user-guide.rst | 194 ++++++------------
 2 files changed, 86 insertions(+), 246 deletions(-)

