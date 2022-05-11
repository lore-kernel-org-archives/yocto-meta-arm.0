Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBACC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:46:08 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.1105.1652283966204976700
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=u3tHGAm5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id k8so2561069qki.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D2Y0pwwIWpifLd69L7o0bTgfvvSyuEUF9VGd/NgheJ4=;
        b=u3tHGAm5TmDLh+pRoFuqwcOrFDP8E6is040Nql9OzzviHgAFO81D9hVoRXMrCuhO1s
         6xYro+76udtsa56VgpiPFL1tohgHq0LMXdYgfPH3AmRgRK+CWERyks1AakmzeoVrUbfJ
         ZIqfyhJbJxWZCEDhaoHFvIX7bhQZXt+jwX2XpujUfqQagzF5MpoMbP8UvvwOzZ9CYwRg
         0rKZyU8MaL7dz/sXBKKkEV5XU7aDT2MZ6aK/xcQ50NO9iReL6b0uc4aeOYHvZFaF9z5f
         OWMaaLEtnSCrXdNSqYiEuYEztkSPbTDOaiZUsr0zwadY3KGV/FqzmRTWvIOW81hjZCZs
         nS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D2Y0pwwIWpifLd69L7o0bTgfvvSyuEUF9VGd/NgheJ4=;
        b=TKMA0AGSohmecQUMGT3uk0SH/C23dYmsrceGBW/1Jl8uIJ5QV5nBXG8DurMipurZXD
         ArNm4uPbSXQjuBgw1K042HAU70Zoxa2S5K1CKpcw/cD+hVeWjhAdatSAim1K0k3C3CiM
         tvQBfE+oXFByCu1gUC7530Z4i1LNtaoE2kkRvdOsuf0DO6rKJ0tx9z2hq+d9Vw3j2zit
         Xyj4tN2PaVLFu2luWSY02u8rPiC6Sv13RJz7CUbdZCSOy7SnLO2rvLyIhcd7ErL9cccG
         sbpdhcRavFq/2faVijyg5Ka/5DJaNZ8dQFcWIynGPCaJk3ZFDxLZOCUjd5cHxEoY0Gii
         XJfg==
X-Gm-Message-State: AOAM532juzMNuOn10wq+ST1tiH1wiDYwNHlQ/xtFbnzmLxy+LKO880Br
	sam7y9W65WPLPgMsD3K6FgXAbSxdQqDyq5I8
X-Google-Smtp-Source: 
 ABdhPJygSxaZHTkOsQGFj6kta4dKTcZwUUPUHlN2Wz0HGOXhMAK65dn7O/uRyCdF62rfAGfnuM833A==
X-Received: by 2002:a05:620a:24c3:b0:6a0:7b54:1e02 with SMTP id
 m3-20020a05620a24c300b006a07b541e02mr12394125qkn.308.1652283965114;
        Wed, 11 May 2022 08:46:05 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 r14-20020ac8424e000000b002f39b99f675sm1249128qtm.15.2022.05.11.08.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 08:46:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] optee: Pass HOST_CC_ARCH for locating compiler runtime
Date: Wed, 11 May 2022 11:41:16 -0400
Message-Id: <165228367703.3678131.11630166365272822895.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220510213723.3849286-1-raj.khem@gmail.com>
References: <20220510213723.3849286-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 May 2022 15:46:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3386

On Tue, 10 May 2022 14:37:23 -0700, Khem Raj wrote:
> This option is used to find the right path and file name of the C
> runtime e.g. libgcc or compiler-rt, when using clang it needs to know if
> compiler is using hard-float or not, since the compiler-rt file names
> are different for these two ABIs libclang_rt.builtins-arm.a or libclang_rt.builtins-armhf.a
> The option is computed in HOST_CC_ARCH for OE, this fixes build with
> clang+llvm-runtime

Applied, thanks!

[1/1] optee: Pass HOST_CC_ARCH for locating compiler runtime
      commit: 03f5819187ee1c3e35a417866e0f94e47d483de2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

