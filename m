Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A6EC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:03:41 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.6292.1678280619716317615
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Mar 2023 05:03:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=vH5nosXe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id r16so16292886qtx.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Mar 2023 05:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1678280618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjZo4uwcQGpjotAzvWk42d+HHZ0ZkBZnEPOzipmMs/8=;
        b=vH5nosXedwPgxAd6DDE3zTFEyI1QRTy/uImY5Wx/sugPbNQEL1ekS2E/SMYp+O7bls
         ZFxdxmZUYCCHaQYu5FbJhXYTTZrTao54fDb+N7XXMwi4u5wv2uvAEd32mKevEDE2HYSp
         O0Fw8dfHChCL429yeVgzibJ+ts2S8gDALPxyHM4NpsiHGcTb/jl0geZvV0Hzk/nn/Tky
         x6G93UxHyiDu9X9wi7syDZ6SA5CLhiLniBJLKmq98uCl2vlsyt1OwhdElu9OSea0+mGg
         eagtbPVKUc5Ou0LCtoWD8x0pRiOdWqa+f8IU/YM+FVsmp+PFo9IBW9BGCABb/xzyKuTA
         L6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjZo4uwcQGpjotAzvWk42d+HHZ0ZkBZnEPOzipmMs/8=;
        b=w9qFEUqB6WS91+x33s9VAG6cLG6ZV685jbN8NVZBub5duNKmjCt4kwQZPLtyd3kmvA
         6T7UvFGryn4hDPqNhEsPX/R84afinpPf76P5MYmsjaXHcJDlHZINIQ6kBEo58HAEM5mu
         46h0YXTHeF64+j4FzYwefaf/Tl2kbepRooHW4IJkRP55U7z++dyoc2UVbFYObTyfG9iP
         6+w8l9mnEu2brtnybz6BHUawa5HhjIjA1jdwtKf8+aDvPx7lkOkuQiAhdAXQB8+rWz+e
         yMvTioz7HXtAHGC+AdJm2Lu8okUoEJODBrv8SO/WL5f3BqqX9dGKWCEN8Dm4McEFfRPQ
         v+yg==
X-Gm-Message-State: AO0yUKVwuNm+jc9lQ1N2DUwj+GaqtD6NO4l1/5a7Px2AVVkLKp4eaolp
	4noQA2fO9a8q7UUabVtZp07gWb/sA4GWpTmJD6A=
X-Google-Smtp-Source: AK7set8L4tcorZZ+552d01/LYp3KEnKcN0RnzMRQbWeic3HoRX1BFq+xOzhTAq+rnEgSfmtz15pw6w==
X-Received: by 2002:a05:622a:118f:b0:3bf:e471:6987 with SMTP id m15-20020a05622a118f00b003bfe4716987mr29461433qtk.59.1678280618298;
        Wed, 08 Mar 2023 05:03:38 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id r13-20020a05622a034d00b0039cc0fbdb61sm12020539qtw.53.2023.03.08.05.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 05:03:37 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] CI: add yml files for defaults
Date: Wed,  8 Mar 2023 08:03:30 -0500
Message-Id: <167828061270.1577224.16915668711878903861.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230306205046.472156-1-jon.mason@arm.com>
References: <20230306205046.472156-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Mar 2023 13:03:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4480

On Mon, 6 Mar 2023 15:50:45 -0500, Jon Mason wrote:
> Make things more obvious by adding yml files for the poky defaults
> instead of disregarding them in the jobs-to-kas script

Applied, thanks!

[1/2] CI: add yml files for defaults
      commit: 1da8d2fdb577074a4eb21b91a2cb6e07aee8aa12
[2/2] CI: add support for dev kernel, rt kernel, and poky-tiny
      commit: 360a278c449775bbee3ca4c1f3d2ac3ef7a885e0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

