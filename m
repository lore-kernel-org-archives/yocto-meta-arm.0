Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0257410AB83F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 01:48:39 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63293.1774576114431846350
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 18:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=XdiMze52;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506251815a3so14228411cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Mar 2026 18:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774576113; x=1775180913; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7AdYM/W2/1p2eYIcQYuOQMlo2KesxOhti9y1ha9wOo=;
        b=XdiMze52/+PLnKM1dSXFTqLZ0XfM2e/pjSl1ScIg6ItyaA2uHGYpgOvh2OYZQWf/KU
         8UCEfvaQbjrVMQzkzXp2kQJ18LiXniZfrvlmpqgxrZPyM/95VmqYDK9CX97KtnIC/3YC
         ExnDEhlQDcCTqTx+r5pfFaaeG/mNyF1HpISgMdSroYdR0KBGwm0g2u5WvSIKojV91jih
         q6cT15LUJtYEXaic1xk06qwZ9EANVv/OobXOawAxT9FE1zK71kAulrYn71s4CFDzI/WU
         v0yfq0pcrSvII4qzrgfKLc38i97486HT2FlQmKTwXotICh+VhLzbeYMBygDB6kZebcpk
         FXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774576113; x=1775180913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7AdYM/W2/1p2eYIcQYuOQMlo2KesxOhti9y1ha9wOo=;
        b=PQzjBcAVddpKQNWqlvgA/ADIMgz3phjLBOP7+0Iv5m4hJp0eUvSDUE+dMCT7anN0hE
         YSSDLjjQqO/C1FonBItpjbpNLE5fAHS6MbYQBOKR6Ja+MVaodQXkR6tHaLGMD2PbZFwO
         Z0wAGCnbY4yTUvv+gnqejgTS7DkkcnMlZ8HuQkvpeC32m+WKiwDqmVhqemxwxltamw+B
         7ui5L4smBmqB4Ys9KqIwcw/AgU0HFlGOdx0XhYpNpDdEkNWlDr1jS4sRRUAr5YnDhW7M
         517pP6NyAIH9Gcq7JL21t/HYhceqPwNF66J6PuaW1ehJb9uQWM9/WgWf9VQuhV2QOhHf
         TLuA==
X-Gm-Message-State: AOJu0YxnuVweEvTbRIsEKEo0oDQAewYbvuR1DuG2HSF93ClwR9HbAen1
	SPFm/tTRry/84OoBcCJbha6ENyGH4OIgqEDZGVE1VUZwJHmF8UFq+aRrPEbNssqdf+UjIEU1pwM
	+eqw=
X-Gm-Gg: ATEYQzzGlV8jZ3Dhi1NJSaz7nOfhiPrisAdWwUFpnYO0P+Qc9BooUePiafZtk43ZDu7
	IaUUTBmwdET9My1V9q4BZuR898Vg3k0innWduwapbmpuEPlQejeyX7V0Tx/Ko7VjzhNh/ZFKZp9
	YgycNomUDpYyEzbJQjtbv9EcQOym3OppPqrzsAyfCRIN5UYFwyVE7swAYxCILSaDb9j4AZRuT9s
	nkxc5DuOsP3xaP+j6S7IMl+4eiKN8YjMZ5VLusLPV3jI1DQp28xNvb1y0Ri4qJ9+9RgsqIWwzMQ
	p3f/0e+dfz1vWCbz7SzWjEbBUNVBtvEzNqHhat9XKXZwk7AY8+OZKiXTB267EdXIszWUGlQWrue
	R/WcoB1puZSjEKRzsGI80s2ZbhWtikcXCTlDnaB1PrPk84BXz1grobIqsfhog/1YS5TEiLokS2M
	IOSOoI6mhTjuAC
X-Received: by 2002:a05:622a:90a:b0:50b:3ec7:ed16 with SMTP id d75a77b69052e-50ba3809d75mr12707061cf.13.1774576113178;
        Thu, 26 Mar 2026 18:48:33 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd58b5801sm44534716d6.20.2026.03.26.18.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 18:48:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/fvp-base-a-aem: update to 11.31.28
Date: Thu, 26 Mar 2026 21:48:20 -0400
Message-Id: <177457610090.1782542.4607118643131152475.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260325152555.84335-1-jon.mason@arm.com>
References: <20260325152555.84335-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Mar 2026 01:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6977


On Wed, 25 Mar 2026 11:25:54 -0400, Jon Mason wrote:
> Massive layout changes inside the FVP tarball.  The files are not
> located in *_FVP anymore, including the license files, which were in 2
> locations in previous releases.  The tarball changed from
> Linux64/Linux64_armv8l to Linux_x86/Linux_armv8.  It hchanged extention
> from tgz to tar.gz
> 
> Also, adding skip of dev-so, due to libstdc++.so and libsystemc.so being
> symlinks and fvps being a binary.
> 
> [...]

Applied, thanks!

[1/2] arm/fvp-base-a-aem: update to 11.31.28
      commit: e9b1f3bbbd58a3f451c93166f639ddc8ce262eac
[2/2] arm/fvps: update to newer versions
      commit: 0d6405b26808d72ad9bbb4b5aa504334120193a1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

