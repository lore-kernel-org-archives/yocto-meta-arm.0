Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA02C4167D
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.1753.1649296828345430748
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 19:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=dxNpxaHH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id v13so1124830qkv.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 19:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IBicnXMrbpLjlyxQuT53rzgTGyndfiqSTpAr9gjJR4Q=;
        b=dxNpxaHH9WsIZCM6yI9Hyu8bFQzzG0UGmo2CoQthHGY7p3wajhESHLaTY45jwf369h
         VOMX3WsKpDQfpXSiZ/NnV3CWc1DOEl6ua5SdEMxuN0pmDDFAIT0IweWn5SD7ovPnfcxq
         eZ4BMVzUrS1QXg566pr/xkjbVkSfB0DS5/wanwez9AC5cr36IkAYdqwKnF1PAPnICSOq
         HrPlGnKnaGE+lX9MOYF5VSSenAXX28WBDWguMLBmEQYBxiLmQpNMbqEU089FaFNjqone
         R8lEmzyD6ftDWXHZ+UyRTgu5nKGhgMrQdJWcV5q2sZ0euwtnAicxLHhReJBy3BfElKsI
         NZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IBicnXMrbpLjlyxQuT53rzgTGyndfiqSTpAr9gjJR4Q=;
        b=JMUhWR9ggxCqlra4EjzkLdOj6naWdV8MiICqlvL2RiSpWi9/fwATSVB3a93cYB7Y9H
         ssZC1KaUe3j/3AWl3OjPN5ZPTcWe8zwHRIvf5uJtIqBg5dhba/43mkDiGyLa8plyDPT7
         9InDf6DJXGK4SPg5CWZqLeWNBkKYRqkxcj1nb0zy1cuc29OcIJR/7Df7qgp+2esMQsOJ
         7VV7zztM4seXr+B/fbOz7fCwrbLZsix4X8hy86ZalSNJV4bC9rPpTvmP/O7PF6nWZmrX
         MvnRPIXfIIyrtwcOdDdNKmdWkKSpW29KLEKaUl//KcPteOTOgiY1NmcV0Y70aCsFSx0I
         0rfQ==
X-Gm-Message-State: AOAM531mPssjbddSpTGJp/GCDWHYwPVPN/SOVjF1zsMESLn14PuvVBgT
	ymLcRH6UjIJbFWrD4HArJlQZBiMq5PMdSA==
X-Google-Smtp-Source: 
 ABdhPJzjLc/V6GHOntSeyOrwBRkVUTPet0MC3DJXduzvlERV5L0nBkk+RQJJRkkSgOxWyYUK7D+KBQ==
X-Received: by 2002:ae9:eb8f:0:b0:699:fa9b:1304 with SMTP id
 b137-20020ae9eb8f000000b00699fa9b1304mr1325319qkg.725.1649296827283;
        Wed, 06 Apr 2022 19:00:27 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 p8-20020a05620a22e800b0067e75955f5esm10656237qki.77.2022.04.06.19.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 19:00:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-toolchain/external-arm-toolchain: install to
 libexecdir not datadir
Date: Wed,  6 Apr 2022 21:58:22 -0400
Message-Id: <164929670183.2494435.114666727248972500.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405134810.1999000-1-ross.burton@arm.com>
References: <20220405134810.1999000-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3247

On Tue, 5 Apr 2022 14:48:09 +0100, Ross Burton wrote:
> $datadir is for architecture-independent files, and a compiler is not
> that.
> 
> Install to $libexecdir, and clean up the installation commands whilst
> there.

Applied, thanks!

[1/2] arm-toolchain/external-arm-toolchain: install to libexecdir not datadir
      commit: a92e076973506a1a7b1a5308370322ccd8e734bc
[2/2] arm-toolchain/tcmode-external-arm: skip gcc-cross-*
      commit: faec9a7ad377e5b4a3e039e216dbb9c4093e45ed

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

