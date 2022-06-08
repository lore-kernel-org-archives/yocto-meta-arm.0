Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E00C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 13:00:08 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.6081.1654693203436623188
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 06:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=N1I+DXey;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id y15so14804728qtx.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 06:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWNvtyLUCKC1RZWCmkKCICTNOVrRy2gP93kDneeA4Ec=;
        b=N1I+DXeyfKOlJxz8UlbU4s/qtfIlymYjN1ZuSAIdHzdrN6NXKV50AZp5nYgdBORSEl
         /UYsXGphPWD5BEwzTHzluxNrGlmJNUbjhbWKPAj2x3T2Wf+/vUQMNbOquKR5kG8zVnsQ
         iRUUAiTHJJaSriITCRGJVISLZTWxFs5WEqVIXMz6eMAiuwacZe6Twt8iwm/GGq1Fu0/a
         syDYdIWnKWFbvy2Ei15+vKDU17+PhZxnF2uOidBtRdetgvMhvxBqklXHL5aHmUptSxrj
         Qi5QFh1jyuUQ90nw+5/OUAQ0JE3N7S9GGFqL1hdeg8PJeDQkLVPPsfoEtNOvWwFeXj5g
         qSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWNvtyLUCKC1RZWCmkKCICTNOVrRy2gP93kDneeA4Ec=;
        b=dpWqpdg1Qlh8zS7Iz6sWQU7Z0KLtvrvQM5S0Xa5Y2qKMuUodXij3z28WsgKvZKblYT
         DHDrElLdRiiTWonUJ/am0e6/LSNeQoTO+sx/oyOBMsnDN0SAeQWOIWcY9y6wqz09A9FN
         7bC3uj2O8tJiFjWys17+L8JFukMFzevFNYUHMbFM8GMIkIu70xRqu2nS5ySngrTYiXy1
         kT5gCvXDy7OqoW9JG/EcO15WGopurT2pzaoHs3d9kmcjok0jRXiCqLbUqvf5gDQuKSph
         E2Kd4JuNXmcuwiSJMbe0AmE8Fkxqg+BwAStjDgdWkd+Pl1yFnZlY6o2IbEZtRbaItx4K
         IrGQ==
X-Gm-Message-State: AOAM531jge2qZiAv/nAA5ROI0o444+YJtDfh8j1Yx2Yq20ZGlrEHiAEV
	ilvYE69n/TAsymZ47RWI8hGQhXC5oUqOOg==
X-Google-Smtp-Source: 
 ABdhPJyevcfBTtYK186OYGsYmEw1SwA2h99x95I/gVYLMng0L1lWH2LwEy39llstvj8OMGO7xKlSRA==
X-Received: by 2002:ac8:7f4a:0:b0:305:8af:a789 with SMTP id
 g10-20020ac87f4a000000b0030508afa789mr538597qtk.528.1654693202426;
        Wed, 08 Jun 2022 06:00:02 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 r13-20020a05622a034d00b002f9347e6419sm15344396qtw.84.2022.06.08.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 06:00:02 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] CI: upgrade external GCC to 11.2
Date: Wed,  8 Jun 2022 08:59:39 -0400
Message-Id: <165469317946.3617250.10783758781326395562.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220608091637.109635-1-ross.burton@arm.com>
References: <20220608091637.109635-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Jun 2022 13:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3489

On Wed, 8 Jun 2022 10:16:35 +0100, Ross Burton wrote:
> Our CI is now running on Broadwell+ cores, so the 11.2 release of GCC
> should work.

Applied, thanks!

[1/3] CI: upgrade external GCC to 11.2
      commit: ab7144ff19af24a80c9bd379fc2830c08f698e09
[2/3] arm-toolchain/gcc-aarch64-none-elf: upgrade to 11.2
      commit: 5c9017f7fdab218b264bd610bb359a861480a7d9
[3/3] arm-toolchain/gcc-arm-none-eabi: upgrade to 11.2-2022.02
      commit: 7007a9c0eac10767ed7186ad87aafc5bcb6ead66

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

