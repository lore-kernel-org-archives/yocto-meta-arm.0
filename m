Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E508C25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 13:28:27 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.6579.1661002104068789352
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 06:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Atnx5eLn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id p5so3633063qvz.6
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=VrKSwMAshZgXRq8nen9rUEei8QH+Xk4CDuBmrd80Foc=;
        b=Atnx5eLnJ3+Xz66EPzLb+n3g7stcWndZAtWz6CEZjxT86ASsej57VNlCwR+7AFOkGj
         qOpK1Rav6Btek093BoSoMt7pAJf/2fNgaOpuh4tbDL4U9nM6crvw/pcE6dl3RLhUg+vv
         JPbRqyWB7C4VcoxQ5jqf8umYqNniJXfWPMDcQiZ1w75ds2NxVQXE7emZxx2UAj1+nEa8
         muzLbjpgjKqlHvGNjgcMjbT4RrN6GHTB61t5ZzaaRdEtzeX2c0sVqeuvKmFEAq6HdkhX
         H6VZd8UKc+ct+q0t7pKBVZi6nR2tM6oF4RWldMu2V5ISaqqP1aIeZhJ7WBPFvqW9SXTV
         cSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=VrKSwMAshZgXRq8nen9rUEei8QH+Xk4CDuBmrd80Foc=;
        b=aLcWTzrT+u3jTN4psZXLH2JVOsrFPl284L5IPqU1kEKtFfunmf17DH823bxrQ6JWz7
         3NUKQYChblR8ryowVc/abPDjO2QK7gyG4HpaccTh9VDsOp90r+jTeKMUTFruyB8JbhRQ
         po/ily1LzIq4lWvFKBlKI9+u1a16g7OyVlfD67/GDwzbJ/LSiMOtPK9SJgHkqeKhWjCb
         SbRpNrsshAKlqdwjOQaMD4OgqIrFtWtNTWIrWxDr9BTHMeQ2T5zNb/SZjsFDrroPJ9r3
         eHySmAYZIxNTyk7FTqqmpI94NpHQl0f+026DCL3zHD4FQBan6o92nqzLCyecbE3rX9PJ
         Qblg==
X-Gm-Message-State: ACgBeo15846tVfU8Xue7WsRuLWHM8OSrMWskW2tBmxTYmF1Glmg6RmBJ
	6cZthriWpUYNfT3olTGFGbdvIOfzmTV6ONsM
X-Google-Smtp-Source: 
 AA6agR7J8E00J/sj8jDwwt1dUCiCB2E+wmWWjdGp54VZv6G/oS3O56C5yNmFNqc4qorrrVQ0ms4ijw==
X-Received: by 2002:a0c:f542:0:b0:496:d6dd:cb63 with SMTP id
 p2-20020a0cf542000000b00496d6ddcb63mr1093899qvm.0.1661002102649;
        Sat, 20 Aug 2022 06:28:22 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c23-20020a05620a269700b006aedb35d8a1sm5958459qkp.74.2022.08.20.06.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 06:28:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-base: set preferred kernel to 5.15
Date: Fri, 19 Aug 2022 15:30:20 -0400
Message-Id: <166093742254.3928108.12834561606676106837.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819172825.28659-1-jon.mason@arm.com>
References: <20220819172825.28659-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Aug 2022 13:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3705

On Fri, 19 Aug 2022 13:28:25 -0400, Jon Mason wrote:
> SSH tests are failing on the 5.19 kernel.  Temporarily set the kernel to
> 5.15 while debugging the issue.

Applied, thanks!

[1/1] arm-bsp/fvp-base: set preferred kernel to 5.15
      commit: 53870ee43e5732d6d48f12ea120d25043a70b877

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

