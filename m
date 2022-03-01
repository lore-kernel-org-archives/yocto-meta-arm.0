Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7CDC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:22:23 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.10080.1646151742079706888
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=hQ4mTGrm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id jv12so109134qvb.10
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=npzEN9QN4aViEQvL7Cv5Jd0renibqDGd/CDDhP6jSbQ=;
        b=hQ4mTGrmpFiePOyI1ywHfUG02IxO8q5xqmgdZFRTaQFVm9pY0w4h6m0ITG9npRhhFz
         BQgjD5xZfVE2WPw8jDb4hDhQJUoJyp2nw2Rx2NQzYbNYX9ERIuR5SYRozMPrxUmFU2/v
         8nNZ16vnFtbumeF2Vv88czJTSDpHECm1mDihRGShzjam3y3yHbHTKFApuf9UivA1benw
         ftWIYiq23tdNZsayRcffyOEUO6brSJyIdTG9PVJ8N8q2ZcBE+u0Dio/v3XZvw5cYZa/C
         FGaIQm5nPQaJnCJYp1NOETAjspJfJ0tcE9ebQbKPguDyhY1msX57z7x4ppPny+zWtR67
         5+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=npzEN9QN4aViEQvL7Cv5Jd0renibqDGd/CDDhP6jSbQ=;
        b=FEJ/izcEFD/5SWtCgc+H0rg7Buk2zNF7X+ijRxnJFB74+PWbdwHUVrcnU2QXSS5wcb
         2qvNLiIj5Z1c3KopLA5lqFs7tdErqRaAHeW1QOZrfxrYAJNzyMlgS7dPx75ryquF9E6k
         ktPOYE5HGoayD6L+FSQixPTF3xYXkqLVW3Hba1zcIbvq0AVi1Mbx8wROXA7LM9G74YRp
         x3R+eUqFptF3swmE50rz82webLsANDerngyd2xsRwnoT0PXfPgz/zTmdYKMKytp1HXm9
         OFyuazAn6d/Jk6hPPKppUgN1tQ0YYH68tuQHLLJrwRdYFLUoAo6CArD/gXvr2vzEpxVi
         R2fA==
X-Gm-Message-State: AOAM530GMcchQSvyoq8K64Ev4u/DT4Smpcpsc0P+L4vpoziLgA0DFe+F
	oy3gFXs+rsbE3JktsKUpP2PUiFYEc3eihw==
X-Google-Smtp-Source: 
 ABdhPJycII910EGCd9/tMyVIONmNDQq6HqnL5P3Xb7UjJjpqjNxigFPMZFbldXVdwc0ewtJpbochgg==
X-Received: by 2002:a0c:ec04:0:b0:432:274a:a1fe with SMTP id
 y4-20020a0cec04000000b00432274aa1femr17800819qvo.68.1646151741103;
        Tue, 01 Mar 2022 08:22:21 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:21a7:7bac:7802:e911])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a05620a22d300b0046d7f2a6841sm6730638qki.74.2022.03.01.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:22:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] androidclang: Skip useless-rpaths check
Date: Tue,  1 Mar 2022 11:22:04 -0500
Message-Id: <164615172479.2923434.15841615380843983371.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220227022844.3604861-1-raj.khem@gmail.com>
References: <20220227022844.3604861-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:22:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3086

On Sat, 26 Feb 2022 18:28:44 -0800, Khem Raj wrote:
> This is a prebuilt stuff, better to ignore its guts.
> 
> Fixes
> androidclang: /usr/share/clang-r416183b/python3/lib/python3.9/lib-dynload/_posixsubprocess.cpython-39-x86_64-linux-gnu.so contains probably-redundant RPATH /../lib [useless-rpaths]

Applied, thanks!

[1/1] androidclang: Skip useless-rpaths check
      commit: 3fbb255aa744a75e905638c19d096cb2ee90e7c5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

