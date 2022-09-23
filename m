Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAA0C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:24 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.8949.1663947135117844124
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=UdKRL/ad;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id g4so146838qvo.3
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=o/MIkfrmivKuMwtwBmsB2mcLcSCI1+8iUwJ5tndnkFQ=;
        b=UdKRL/adwF7aqd6lQKMXM6S9n62GfWzz4Gajf/KTx24RrDGSRyr8quzca52JW4U7wZ
         63Q+LNw9c7oz0ABqeTcWGt38T2jgKaNHHif6yfewLQObv90nluBG78253+dLfsohYRaO
         6RIPRsPSOYjIvqc0IbB8aziR916oYSVGmadX91iHKqTGnofKlZ3hAunwvqhWWsf/fJhh
         BGbhy3jZEOPTrsmEtxFhTDE8mYm4SxZzMG40RvV/LeBXkGCgy68/hmP0oY2BPJEEjY2I
         hxibKeH9oPECeGAuWAxAH0Dv0X67SEZ4CQRt9ZRFUM8IpcMPbLteDmjScesx1bRYGDkc
         UiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=o/MIkfrmivKuMwtwBmsB2mcLcSCI1+8iUwJ5tndnkFQ=;
        b=o/kv5O84fIpe9UPUn2gON/1UUXXnU9MyQg+RNxGTNqIhBJSAEZACtVL7XtpcAKlZog
         fMGETQ4z5foEl6hHNUaS1VT0MbqqpgY+jFWHKm+sLLvqX0s2g6IaMeGBswe9MpPyZUmJ
         JLZB4qBH0o2k/vGnMXoUhT8o1txdrx+mrYLyToff55XhH434VackfZy3gMgnj8WIy6i3
         113PSHKA8Owan365vW7e9OrqZzbzVd+kFEW5RFgjJPBAUl/yLc630JTKjD3WTpdMD7Rs
         MDZZfLHdOsDwazeYCAn3MlgqXQ8y1+MlIqG/9qu4fukNYecaiLfXnD+4ssOR0fSwcmCe
         X5kw==
X-Gm-Message-State: ACrzQf3RVypXx0bREMbPHFh6Ja7KLUKUuyRmTTkeHl9Ll6sq8n0K7BXW
	hIqyXKpju8AlWeqEV9LzcZv5+fceQ9tFWw==
X-Google-Smtp-Source: 
 AMsMyM64/Fe49aditQ9Z5PMBW8LTQ33X46P06nn7Mj4fBC3t95eg7K6a+b4uYfOHnnO4Bd07xv2yUA==
X-Received: by 2002:ad4:5c6f:0:b0:4ad:378c:43b8 with SMTP id
 i15-20020ad45c6f000000b004ad378c43b8mr7206474qvh.101.1663947133820;
        Fri, 23 Sep 2022 08:32:13 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 b25-20020ac86799000000b00341a807ed21sm5342582qtp.72.2022.09.23.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:32:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] optee-os: Extend clang pragma fixes to core_mmu_v7.c for
 3.18
Date: Fri, 23 Sep 2022 11:31:03 -0400
Message-Id: <166394706727.2062239.12861443743622250483.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220912042854.1958192-1-raj.khem@gmail.com>
References: <20220912042854.1958192-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3825

On Sun, 11 Sep 2022 21:28:54 -0700, Khem Raj wrote:
> 3.18 builds are failing since the section stuff is also done in
> core_mmu_v7.c therefore extend the patch to include this file as well

Applied, thanks!

[1/1] optee-os: Extend clang pragma fixes to core_mmu_v7.c for 3.18
      commit: 7d8b252405153ac0af5affedbe9423c993c0f483

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

