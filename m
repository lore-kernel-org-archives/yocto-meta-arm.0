Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3AA105D9B5
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:59:49 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106976.1775656778676594470
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=kzX39BpT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8a00566c11bso86184296d6.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1775656777; x=1776261577; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxKxRVfnTy75PHG5yAYgL5ER+mPZjAXQz+YmsfFA5U4=;
        b=kzX39BpT6qeDteOf+7og7PmEfvr+ZDbBNPLMWxVcZDCM7HsBPgDbSqOl27QaVjRzKu
         p8AH9X26qStrO+C7c4Dg1/tATVyCOc5WiF0+5pRcr6qYITQXUHYuogO6wYc2V1/km/eD
         Xg3uh4MBQ0yO6dse4vV9baGauLVcB7xorWlmRhuc4QPYghJUS4NdsDQgLqClaG7AKCnt
         sJMMVT3Blto1XPZOV35QVQrVIrip14O5wHWPmoJlCxEiQhRydp01xfjmr6Gy+uI4/jaM
         cC27x4YAUOymIRCJGvtr+iBa0f0LjKsG6jhYNw8XXnzJ3SZXQxSIlYXecCza3lof2vfV
         OQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775656777; x=1776261577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxKxRVfnTy75PHG5yAYgL5ER+mPZjAXQz+YmsfFA5U4=;
        b=otu7C+sky7iQL+PjEOYmpThm3rZUT9mgJUGoxLZuiTjL15nkNBvx02Q6Mhj+/cmXd4
         vsGKBbZ5E8UodBybOSXLr3Pt6khM6cCo4QjsJhUv0YN1dCZkTj3lvYcq3KbbUmjdYlX5
         TPJX+oQtmvJATs9q6j9jUzI0UPkjRVPVEgtpXfZUZm5lW74BdFPN0jqmKSVvwzzhyWpF
         Whjvl2swGiKlo9T5rjtA8B/7ZjPKth6pmv6rW8xwjPCTL9OOEVIrp+AmvGBUoxBXmI/f
         pMw/tt10tSjdPUpo34bG+DR7eoXcCb8pKsOxtPkD1hNY/CflL0xBVdO6Fj8nEenPhlro
         opQw==
X-Gm-Message-State: AOJu0YzNvjdyZqrqHaoD1PlKrIJYbIxcsYojmqv86WsRmrXVwP5xCJug
	WJiukCcMN9y3QCAI+V0mD11ndVI9avDNwVFTRelSUBvr/eL9L8qcmtQYtcFE/bKfTI+xNS8F8jd
	4ftc=
X-Gm-Gg: AeBDietNwmnKilmiDUFPQcKlXwAawQtUvWGWxpraAHJmJm4UmcUgbPo5zxo3rAEQZ9U
	qFVcDFU2V1DoiMD0xZbcVY1gfu8SjVvx6ytCNwWD4voIBAnBae6TWDORygGUN4avxtHyRQuFqIN
	R7iYVMrxMd8a7L8QtWqXIrCWr5ucr5vmkTi9gUnpif6Roc0I/jk2RZUnhiyZmsFmLAFhdgOGQb/
	2NCcnLY0QNDGO128vCNDtNaajieCTbf4uWUQxJCinCKM2iyNpcgFc7CYXIG1ys1Sw77IeQ8QGRY
	laPdjBNnFj2c9+VMIBEsBg3UVjgVXdMTNZCnXmtzTGJ3ae+KSjcgJEh3ESu8XLX2SvOdseykVcb
	FnAjx8/RuYKp9jSQELutwisGEyF7DFj9n7criY7bA3ZPMAcYhUZptd/8ZmRAgQBYvnqPjll+mIy
	L9eDtROXkFGu2X
X-Received: by 2002:a05:6214:27e1:b0:899:fd80:f79f with SMTP id 6a1803df08f44-8a702b9b8bbmr329698296d6.23.1775656777365;
        Wed, 08 Apr 2026 06:59:37 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596e03cd8sm165403496d6.33.2026.04.08.06.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:59:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp: remove sgi575
Date: Wed,  8 Apr 2026 09:59:24 -0400
Message-Id: <177565676545.3315457.4137929594703068271.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406151543.99621-1-jon.mason@arm.com>
References: <20260406151543.99621-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7006


On Mon, 06 Apr 2026 11:15:42 -0400, Jon Mason wrote:
> sgi575 has been EOLed, and requires keeping around some recipes because
> of its removal.  Also, the FVP is x86 only, thus limiting CI.
> 
> 

Applied, thanks!

[1/2] arm-bsp: remove sgi575
      commit: 4257c9856e28c567803e7d958e1dec84544ac268
[2/2] arm-bsp: remove rdv1
      commit: ed7a9378e106056185de24d9500ac17e3132c3f5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

