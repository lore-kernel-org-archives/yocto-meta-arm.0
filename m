Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB4FC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:19 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30602.1784659389757081527
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 11:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=ZmYEp86S;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e622cc874so870538685a.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 11:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1784659389; x=1785264189; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xw/XNiGPZrhAn3Zm+lk3JTe4Z1jXn5nTX+AK04nUHVE=;
        b=ZmYEp86SIuqJMkexTVnfaXnHEFoogRiExEtVnNOPeXw7EOqBUfSUxfQ1+0N/+Z0h3i
         /qu9nO/6FWDrKGSBwcvHEH2/rEUwoxreTFrKxLr9Btm5YMiQAuZlpRd7wzrtAdE1IYpk
         1ctEMCdlKaDiMcb7Y1VQodkc5jy39uvEjEUR8XpUUnLMjzTTlfhzcsBq4X7n+qwQlkqu
         xPUjAU0zFWKRS+PhszD899tb/0OU4FK5mdnNDvB01ELs4f6VgmfmtowEm5QtVLr0Qmqk
         wKQJH1rqhS73LE7bQe0ANEn6gZdmkXWXKSgbWrDH9E7KMbYg5xIacydG6u/R5jEa9ntE
         POBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659389; x=1785264189;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xw/XNiGPZrhAn3Zm+lk3JTe4Z1jXn5nTX+AK04nUHVE=;
        b=n0r/3/CJTKQIzmLTeBEXrj0tgFewWxFIruQu67x7hcK20oGLqrqRDVLdjpDeXc5zyu
         O93352p7ZSy29XyCbf1135x9aImhfxAgK86m1S+Jbcy6VwEHQJwnPQr20t83gfSvjwhY
         8BsIhSJXQ16o3hQ4ErHMLOS4GBYRKrNS1MAcmB1z2ZJjJNKw/fOJ+L8BV3BFl3KKuTLP
         HfcwN9sIPLHcGEv+dSeyz7HamArnmwIAdXPMMcQ71CExnrL05SZB8MjxGuucAwGbCC79
         L/5MiflFzpTnelPjI71z5qkXeUY6tSGkWgnzUVDXQ+Kc2bQnVtxOO0ZRrbLOOAjRv/Yl
         4ItQ==
X-Gm-Message-State: AOJu0Yzr2yPTTWZ+oUwLPgOmE8w3IILo7JA4gHmOiUpuWhTs6wqP8cZ7
	mOymA3BXJ/ON6vtrj8Cdmn/d2+dqxTOmW/7p7fhfRPYOxQMeO5BAcxlHYiOKpx+jhTqs7mvIb91
	FCJ8=
X-Gm-Gg: AfdE7clIzzX93lX8AQ/aHbGscEq4q4VCQYgdI/Zs2oY8jluHMKpVBDQ2Hkgtg/oEVHx
	pjv7Vh1T8Oo/lw1bzattvoBqOGbivOodX4qLU2irWS/7AF2okj9rEo8Upmt+JSuwJCzVyq2YR/2
	BDZg+hZkGGn80VEagLFGp36gYMt/Ji9pAuLesDMWrRj9ZIQevMGUxKI0yxSKHcgCUSeak6cLxsc
	vOcZUFFnw1a4hTUwgCfEzmFJeZQ4RgRVtnqmiDmkdo9DO7tLsmn5LN/fnrY46X9w9vAT6pCn2Tq
	Tb+vC9CrOL4DbuEII4dkPsKeJJVzlsSHSgUO2uxL3PisSlpKdnpeW+6W/pjHYzRdeZRe+81/k3Q
	CVbkIwXxguvVv2zv3D/FIEV6AHdSb+tYY/2coMf7Af5/j4IdySIekbQIC1J59Xx9sA0F63kXNRO
	NalA==
X-Received: by 2002:a05:620a:2891:b0:930:a075:3c7a with SMTP id af79cd13be357-930b3ec7c3emr2005135085a.4.1784659388486;
        Tue, 21 Jul 2026 11:43:08 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545ed7esm1167816985a.32.2026.07.21.11.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:43:08 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] recipes: port LICENSE to SPDX
Date: Tue, 21 Jul 2026 14:43:01 -0400
Message-Id: <178465938142.72400.7475289023349794901.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260721130159.558910-1-ross.burton@arm.com>
References: <20260721130159.558910-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 18:43:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7120


On Tue, 21 Jul 2026 14:01:59 +0100, Ross Burton wrote:
> openembedded-core now parses the LICENSE field as a SPDX license
> expression[1], so convert the license statements.
> 
> This is mostly replacing "&" with "AND", but we can also use "WITH" in
> the GCC recipes.
> 
> [1] oe-core e9d424738d6 ("classes/conf/lib: Parse LICENSE as SPDX Expression")
> 
> [...]

Applied, thanks!

[1/1] recipes: port LICENSE to SPDX
      commit: dc8a847b6baa14a09d2df2a9f8fc421fc6e49bee

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

