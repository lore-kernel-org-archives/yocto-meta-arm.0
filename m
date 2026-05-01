Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221E8CCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 13:30:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14435.1777642244747376996
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2026 06:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=BwSA9H29;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BCFC176A;
	Fri,  1 May 2026 06:30:38 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FF093F62B;
	Fri,  1 May 2026 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777642243; bh=YdYLOtNsu7qNAL7+A870766/PXE44Lbl7SouOyDX2f4=;
	h=From:To:Cc:Subject:Date:From;
	b=BwSA9H29m/vwE8qr3WWqM6MGDusKvmaA1ulN2/kBYbx/wHFRQU+NTAeOaMeM+gSHs
	 aqEgJVjkvYZdF2Vv0TxZn8VQbcd82uSNRpFejzBnd9Xqb+dDVTphaU9ICuKib8Llf9
	 rnswQoYQDc4NFrc8Pfh53aqINdibGR6jLXTrcMvs=
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 0/2] Reduce sudo dependency in OOB tests
Date: Fri,  1 May 2026 14:30:15 +0100
Message-ID: <20260501133017.2820317-1-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 May 2026 13:30:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7030

Remove unnecessary sudo dependencies from OOB tests.
Fix path mistake in secure boot script path.

Alex Chapman (2):
  arm-bsp/docs:corstone1000: Fix secure boot script path
  arm-bsp/docs:corstone1000: Reduce sudo dependency in OOB tests

 .../documentation/corstone1000/user-guide.rst | 128 ++++++++----------
 1 file changed, 59 insertions(+), 69 deletions(-)

